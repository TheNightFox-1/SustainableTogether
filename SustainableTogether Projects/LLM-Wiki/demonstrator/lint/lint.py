#!/usr/bin/env python3
"""Deterministic health check for the LLM-Wiki.

Scripts, not tokens. No model calls, no network, no randomness: the same wiki always
produces the same report. Lint failures block the publish gate; they do not block drafting.

Usage:
    python lint/lint.py            # human-readable report, exit 1 if any error
    python lint/lint.py --json     # machine-readable, written to lint/report.json
"""

from __future__ import annotations

import json
import re
import sys
from datetime import date
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
WIKI = ROOT / "wiki"
REGISTRY = ROOT / "raw" / "registry.md"

ALLOWED_STATUS = {"draft", "in-review", "lint-clean", "published"}
TODAY = date.today()

FM_RE = re.compile(r"\A---\s*\n(.*?)\n---\s*\n", re.S)
CITE_RE = re.compile(r"\[(R\d{2})[^\]]*\]")
LINK_RE = re.compile(r"\[[^\]]+\]\(([^)]+\.md)\)")
REG_ROW_RE = re.compile(r"^\|\s*(R\d{2})\s*\|.*\|\s*(\w+)\s*\|\s*$", re.M)
REG_NOTE_RE = re.compile(r"^- \*\*(R\d{2}(?:\s*/\s*R\d{2})*)\*\*\s*[—-]\s*(.+?)(?=\n- \*\*|\Z)", re.M | re.S)

# Routing and audit pages carry no knowledge of their own, so citation rules do not apply.
NON_KNOWLEDGE_TYPES = {"Index", "Log"}


class Finding(dict):
    def __init__(self, level, rule, page, message):
        super().__init__(level=level, rule=rule, page=page, message=message)


def parse_frontmatter(text):
    """Minimal YAML subset: scalars, inline lists, quoted strings. No dependencies."""
    m = FM_RE.match(text)
    if not m:
        return None, text
    fm = {}
    for line in m.group(1).splitlines():
        if not line.strip() or line.lstrip().startswith("#") or ":" not in line:
            continue
        key, _, raw = line.partition(":")
        raw = raw.strip()
        if raw.startswith("[") and raw.endswith("]"):
            inner = raw[1:-1].strip()
            fm[key.strip()] = [v.strip() for v in inner.split(",") if v.strip()]
        else:
            fm[key.strip()] = raw.strip("\"'")
    return fm, text[m.end():]


def load_registry():
    """Map source id -> curation state from raw/registry.md."""
    if not REGISTRY.exists():
        return {}
    return {sid: state for sid, state in REG_ROW_RE.findall(REGISTRY.read_text(encoding="utf-8"))}


def load_provenance_notes():
    """Map source id -> unresolved provenance note from raw/registry.md.

    A note is a human-visible caveat about the source itself (wrong metadata, unverified
    medium, non-peer-reviewed origin). Any page citing a flagged source must not be
    published until the note is resolved.
    """
    if not REGISTRY.exists():
        return {}
    text = REGISTRY.read_text(encoding="utf-8")
    _, _, notes_section = text.partition("## Provenance notes")
    notes = {}
    for ids, body in REG_NOTE_RE.findall(notes_section):
        summary = " ".join(body.split())
        summary = summary[:110].rstrip() + ("…" if len(summary) > 110 else "")
        for sid in re.findall(r"R\d{2}", ids):
            notes[sid] = summary
    return notes


def parse_date(value):
    try:
        return date.fromisoformat(value)
    except (TypeError, ValueError):
        return None


def main():
    registry = load_registry()
    provenance = load_provenance_notes()
    pages = sorted(WIKI.rglob("*.md"))
    findings = []

    parsed = {}
    inbound = {p.resolve(): 0 for p in pages}

    for path in pages:
        rel = path.relative_to(ROOT).as_posix()
        text = path.read_text(encoding="utf-8")
        fm, body = parse_frontmatter(text)
        parsed[rel] = (path, fm, body)

        if fm is None:
            findings.append(Finding("error", "frontmatter-missing", rel,
                                    "no OKF frontmatter block"))
            continue

        # --- OKF + local schema -------------------------------------------------
        if "type" not in fm:
            findings.append(Finding("error", "okf-type-missing", rel,
                                    "OKF requires a 'type' field"))
        status = fm.get("status")
        if status not in ALLOWED_STATUS:
            findings.append(Finding("error", "status-invalid", rel,
                                    f"status {status!r} not in {sorted(ALLOWED_STATUS)}"))

        # --- the publish gate ---------------------------------------------------
        if status == "published" and not fm.get("reviewed_by"):
            findings.append(Finding("error", "publish-gate", rel,
                                    "status is 'published' with empty reviewed_by — "
                                    "no page is trusted without a named WG member"))

        # --- citations ----------------------------------------------------------
        cited = set(CITE_RE.findall(body))
        declared = set(fm.get("sources", []) or [])
        is_knowledge = fm.get("type") not in NON_KNOWLEDGE_TYPES

        if is_knowledge:
            for sid in sorted(cited - declared):
                findings.append(Finding("warn", "citation-undeclared", rel,
                                        f"cites {sid} but it is absent from frontmatter "
                                        "'sources' — frontmatter is the machine-readable "
                                        "contract"))
            for sid in sorted(declared - cited):
                findings.append(Finding("info", "source-unused", rel,
                                        f"declares {sid} in frontmatter but never cites it "
                                        "inline"))
            for sid in sorted(cited | declared):
                if sid not in registry:
                    findings.append(Finding("error", "citation-unresolved", rel,
                                            f"{sid} has no row in raw/registry.md"))
                elif sid in provenance:
                    findings.append(Finding("warn", "provenance-flag", rel,
                                            f"cites {sid}, which has an unresolved "
                                            f"provenance note: {provenance[sid]}"))

        if fm.get("type") in {"Concept", "Entity"} and not cited:
            findings.append(Finding("warn", "uncited-page", rel,
                                    "knowledge page with no inline citations"))

        # --- freshness ----------------------------------------------------------
        due = parse_date(fm.get("revalidate_after"))
        if due and due < TODAY:
            findings.append(Finding("warn", "stale", rel,
                                    f"revalidate_after {due.isoformat()} has passed "
                                    f"({(TODAY - due).days} days)"))

        # --- links --------------------------------------------------------------
        for target in LINK_RE.findall(body):
            resolved = (path.parent / target).resolve()
            if resolved.exists():
                inbound[resolved] = inbound.get(resolved, 0) + 1
            else:
                findings.append(Finding("info", "not-yet-written", rel,
                                        f"link target {target} does not exist — work item, "
                                        "tolerated by OKF"))

    # --- orphans ----------------------------------------------------------------
    for path in pages:
        if path.name in {"index.md", "log.md"}:
            continue
        if inbound.get(path.resolve(), 0) == 0:
            findings.append(Finding("warn", "orphan", path.relative_to(ROOT).as_posix(),
                                    "no page links to this one"))

    # --- corpus coverage --------------------------------------------------------
    source_pages = {p.stem.split("-")[0].upper() for p in (WIKI / "sources").glob("*.md")}
    for sid, state in sorted(registry.items()):
        if state == "ingested" and sid not in source_pages:
            findings.append(Finding("warn", "source-page-missing", "raw/registry.md",
                                    f"{sid} is marked ingested but has no wiki/sources page"))
        if state == "pending":
            findings.append(Finding("info", "not-ingested", "raw/registry.md",
                                    f"{sid} is curated but not yet read"))

    order = {"error": 0, "warn": 1, "info": 2}
    findings.sort(key=lambda f: (order[f["level"]], f["rule"], f["page"]))
    counts = {lvl: sum(1 for f in findings if f["level"] == lvl) for lvl in order}

    report = {
        "generated": TODAY.isoformat(),
        "pages": len(pages),
        "sources_registered": len(registry),
        "counts": counts,
        "publish_gate": "blocked" if counts["error"] else "open",
        "findings": findings,
    }

    if "--json" in sys.argv:
        out = ROOT / "lint" / "report.json"
        out.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
        print(f"wrote {out.relative_to(ROOT)}")
    else:
        print(f"lint · {len(pages)} pages · {len(registry)} sources · {TODAY.isoformat()}")
        print(f"  {counts['error']} error · {counts['warn']} warn · {counts['info']} info")
        print(f"  publish gate: {report['publish_gate']}\n")
        for f in findings:
            print(f"  [{f['level']:<5}] {f['rule']:<22} {f['page']}")
            print(f"          {f['message']}")

    return 1 if counts["error"] else 0


if __name__ == "__main__":
    raise SystemExit(main())
