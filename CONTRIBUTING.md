# Contributing to SustainableTogether

Welcome! This document explains how to contribute to the SustainableTogether project — a renewable energy modeling workspace combining SysML v2 system architecture with LCA (Life Cycle Assessment) analysis.

## Quick Start

1. **Find an issue** — browse the [GitHub Project Board](https://github.com/users/TheNightFox-1/projects/3) for `good-first-issue` or `help-wanted` labels
2. **Claim it** — comment "I'll work on this" on the issue
3. **Create a branch** — `git checkout -b issue-#N-brief-title`
4. **Make your changes** — work locally, validate, commit
5. **Open a Pull Request** — link to the issue with `Closes #N`
6. **Get reviewed** — maintainers provide feedback; address any comments
7. **Merged!** — your contribution is live

---

## How to Choose What to Work On

Not sure whether to pick a GitHub issue or join a WG workstream? Use this guide:

### Choose a GitHub Issue if you want to...
- ✅ **Complete a bounded task** in 1–2 weeks
- ✅ **See immediate progress** with a merged PR and closed issue
- ✅ **Work independently** with clear acceptance criteria
- ✅ **Get feedback quickly** (48h for good-first-issue, 1 week for intermediate)
- ✅ **Contribute without ongoing meetings** — async work via PRs

**Start here:** Browse the [GitHub Project Board](https://github.com/users/TheNightFox-1/projects/3) → filter by `good-first-issue` or `help-wanted` → pick one → follow "Quick Start" above.

### Join a WG Workstream if you want to...
- ✅ **Deep-dive into research** (Business Models, LCA, Digital Engineering, Risk Analysis, etc.)
- ✅ **Collaborate with others** in your domain of expertise
- ✅ **Shape strategy & direction** of the WG's sustainability agenda
- ✅ **Lead a sub-topic** (if volunteering as a lead or co-lead)
- ✅ **Work in a community context** — sync at monthly WG meetings, share learnings broadly

**Start here:** 
1. Read [WORKSTREAMS.md](../WORKSTREAMS.md) — descriptions of all 18 WG task groups
2. Read [Generic Approach Framework](./SustainableTogether%20Approach/CLAUDE.md) — understand the 8 layers & holistic topics
3. Browse [WG Leadership Tracker CSV](./SustainableTogether%20Approach/WG_Leadership_Tracker_csv.csv) — find workstreams marked **Open**
4. Contact a workstream lead or volunteer in the tracker comments
5. Sync at INCOSE Sustainability WG monthly meetings; coordinate deliverables as milestones hit

### In Doubt?

**Ask on [GitHub Discussions](../../discussions)** — describe your interests and expertise, and the team will point you to the best opportunity.

---

## Before You Start

### Required Reading

- **[CLAUDE.md](https://github.com/TheNightFox-1/Claude-for-SysML-v2/blob/main/CLAUDE.md)** — SysML v2 syntax rules, confirmed patterns, SYSMOD methodology
- **[SustainableTogether Approach](./SustainableTogether%20Approach/COLLABORATION_WORKFLOW.md)** — detailed workflow, labels, review process
- **Validated examples** — see `_reference/core/` for correct SysML v2 patterns

### Tools You'll Need

- **Git** — version control
- **VS Code + SysIDE** — validate SysML v2 syntax (errors from Problems panel, Ctrl+Shift+M)
- **openLCA** — for LCA analysis (if working on LCA-related issues)
- Optional: **Nextcloud** — collaborative design documents

---

## Three Milestones (Work One at a Time)

1. **SolarX AS-IS Complete** ← **Current focus**
   - Full SysML v2 model (all 9 SYSMOD steps)
   - LCA baseline for all 5 components
   - Supporting documentation

2. **SustainaSun v1**
   - TO-BE transformation of SolarX across business model, enterprise architecture, product
   - Starts after Milestone 1 is complete

3. **DPP Integration**
   - Digital Product Passport structure in SysML
   - EU ESPR alignment documentation

---

## Issue Types & Labels

### SysML Model Work (`sysml-model`)
- Add/refine architecture (functional, logical, physical)
- Refine requirements, use cases, or context
- Fix syntax errors or improve model structure
- **Validate in SysIDE** before opening PR

### LCA Analysis (`lca-model`)
- Run LCA for components using openLCA
- Integrate LCA data with SysML model
- Document ELCD flows and elementary flow mappings
- **Test with SimpleLCAIntegration2 pipeline**

### Documentation (`docs`)
- Write guides for non-engineers
- Document SysML patterns or SYSMOD process
- Clarify design decisions

### Difficulty Levels

- 🟩 **`good-first-issue`** — self-contained, clear scope, minimal domain knowledge
- 🟨 **`intermediate`** — requires SysML/LCA understanding
- 🟥 **`advanced`** — deep expertise needed, discuss in issue first

### Status Flags

- 🤔 **`needs-discussion`** — unclear scope, team alignment needed before starting
- 💬 **`needs-clarification`** — ask in comments if unsure
- 🔗 **`blocked-by-#N`** — depends on another issue
- 🔴 **`priority:high`** — critical path, start this first

---

## How to Claim & Work on an Issue

### Step 1: Comment to Claim

Comment on the issue: `"I'll work on this"`

Maintainers will acknowledge and assign you.

### Step 2: Create a Branch

```bash
git checkout main && git pull origin main
git checkout -b issue-#N-brief-title
# Example: issue-#4-logical-architecture
```

### Step 3: Work Locally

- Make your changes
- **For SysML:** validate in SysIDE (Ctrl+Shift+M → Problems panel)
- **For LCA:** test with SimpleLCAIntegration2 pipeline
- Commit with clear messages: `Issue #N: what you did`

### Step 4: Push & Open PR

```bash
git push origin issue-#N-brief-title
```

In GitHub, open a Pull Request:
- **Title:** `#N — Brief description`
- **Body:** Link issue with `Closes #N` and fill out the PR template

### Step 5: Address Feedback

- Reviewers may request changes
- Reply in PR comments
- Make changes in new commits (keep history clear)

### Step 6: Merged!

Once approved, maintainers merge and close the issue. You're credited in git history.

---

## PR Checklist

Before opening a Pull Request:

- [ ] **SysML files validate** — no errors in SysIDE Problems panel (Ctrl+Shift+M)
- [ ] **Follows CLAUDE.md rules** — review Confirmed Syntax Rules section
- [ ] **Preserves existing model** — appended to, not overwritten (unless told otherwise)
- [ ] **Documentation updated** — added doc comments or CLAUDE.md entries if new pattern
- [ ] **LCA pipeline tested** (if applicable) — component flows resolve
- [ ] **Commit messages are clear** — explain the why, not just the what
- [ ] **Linked to issue** — title includes `#N`, body includes `Closes #N`

---

## SysML v2 Quick Reference

**Definitions vs Usages:**
- Definition (PascalCase): `part def PowerConversion`
- Usage (camelCase): `part powerConversion : PowerConversion`

**Short names with special characters:**
```sysml
requirement <'REQ-F1'> 'Provide backup power' { ... }
use case <'UC-1'> supplyFromSolar : 'supply from solar' { ... }
```

**Port direction:**
- `in` — system receives
- `out` — system sends
- `inout` — bidirectional

For full syntax rules, see **[CLAUDE.md](https://github.com/TheNightFox-1/Claude-for-SysML-v2/blob/main/CLAUDE.md)**.

---

## SysIDE Validation

1. Open your `.sysml` file in VS Code
2. SysIDE extension runs automatically
3. Press **Ctrl+Shift+M** to see Problems
4. Paste errors into the GitHub issue or PR

Common fixes:
- `Could not find implicit supertype` → use `state` not `state def`
- `Could not resolve...` → check `private import` statements
- `Could not find 'Xxx'` → verify definition exists and spelling matches

---

## Code Review Expectations

### What Maintainers Look For

- ✅ Issue scope completed per acceptance criteria
- ✅ SysML syntax valid (no SysIDE errors)
- ✅ Follows CLAUDE.md confirmed rules
- ✅ Doesn't break existing model
- ✅ Well-documented (clear commits, doc comments)
- ✅ Related issues linked

### Response Time

- **`good-first-issue`** → 48 hours
- **`intermediate`** → 1 week
- **`advanced`** → discuss in issue first, then review

---

## Questions & Support

- **Unclear scope?** Comment on the issue before starting
- **Stuck on design?** Label `needs-discussion`, post your question
- **SysML syntax error?** Paste Problems panel output, reference CLAUDE.md
- **Stuck on PR?** Reply in PR comments — maintainers will help

---

## Session Workflow (for Claude and Contributors)

Each collaboration session follows this pattern:

1. **Read context** — review project memory, current issues, and project board
2. **Pick an issue** — select from `Backlog` or `Ready to Start` that's unassigned
3. **Work on it** — implement, validate, commit, create/update PR
4. **Document progress** — update issue with what was completed, blockers, next steps
5. **Close or update** — if done, close; if partial, move to next column and update status

This pattern ensures continuity and transparency across sessions and team members.

---

## Related Resources

### Contribution & Workflow
- **[README.md](../README.md#getting-involved)** — Two contribution paths (Issues vs. Workstreams)
- **[WORKSTREAMS.md](../WORKSTREAMS.md)** — All 18 INCOSE Sustainability WG task groups with descriptions and how to volunteer
- **[SustainableTogether Approach / COLLABORATION_WORKFLOW.md](./SustainableTogether%20Approach/COLLABORATION_WORKFLOW.md)** — detailed workflow, issue templates, project board columns, review process
- **[SustainableTogether Approach / CLAUDE.md](./SustainableTogether%20Approach/CLAUDE.md)** — Generic Approach framework, WG task groups, milestone mapping
- **[GitHub Project Board](https://github.com/users/TheNightFox-1/projects/3)** — current issues & priorities

### Technical Reference
- **SysML v2 Syntax** — SysML v2 syntax & SYSMOD patterns (see SustainableTogether Approach / CLAUDE.md)
- **LCA Integration** — SimpleLCAIntegration2 pipeline for environmental impact analysis
- **WG Leadership Tracker** — [CSV file](./SustainableTogether%20Approach/WG_Leadership_Tracker_csv.csv) with all leads, co-leads, and current status

---

**Last updated:** 2026-04-18 | **Questions?** Open an issue, comment on the project board, or start a [Discussion](../../discussions)
