# Pipeline Build — Progress Log

Session-persistent status. If a session dies, resume from the first unchecked item.
Owner: Hamza · Started: 2026-07-02 · Brief: `../TASK-BRIEF-next-session.md`

## To-do (P1 → P3)

- [x] 1. Set up pipeline/ folder + this PROGRESS.md
- [x] 2. Extract registry data + drawio page-4 template
- [x] 3. `validate_registry.py` (I1–I7) — PASSES on current registry (0 errors, 5 warnings)
- [x] 4. Defect-injection regression: 11/11 cases OK (fixtures in `fixtures/`)
- [x] 5. `log_change.py` + `run_all_checks.sh` (exit 0, all 4 stages green)
- [x] 6. `registry2cld.py` → `cld_latest.drawio` (21 vars/34 links/9 loops, template layout, round-trip PASS)
- [x] 7. `xlsx2rdf.py` (729 triples) + `fbmc-cld.ttl` + `shapes.ttl` — pyshacl Conforms:True; SHACL fires correctly on defect fixtures (I1/I3/I7 tested)
- [x] 8. `integrate-domains` skill built + packaged (.skill delivered to Hamza; SKILL.md + stations/01-07 + scripts/)
- [x] 9. Fresh-context verification: all brief items a-g PASS; 4 substantive findings fixed
      (silent skips now fail run_all_checks.sh unless ALLOW_SKIPS=1; 'gate-approval' ChangeType added
      to registry Lists+ChangeLog; verify() node filter robustified; cross-prefix ID ranges rejected)
- [x] 9b. Skill eval run (2 test cases × with/without skill, all graded 5/5; static review HTML delivered;
      qualitative edge for skill: reuses validated scripts vs baseline reinventing generator/verifier)
- [x] 10. P2 DONE: Hamza chose CIRCULAR PV LEASING. PV-001..PV-021 appended (registry v0.2),
      names reconciled from v1 paper + v2 CLD doc into Name_v1/Name_v2; instance rows are
      naming projections ("instantiates GEN-xxx" in Notes; structure stays on GEN links).
      Validator extended: instance rows inherit link participation (I1/I6). Suite green, exit 0.
- [x] 11. P3 first cut: `SustainaSun_CLD_v3_leasing.drawio` generated via
      `registry2cld.py --instance-prefix PV` (21/34/9, template layout, round-trip PASS).

## Next session — RESUME HERE

- [ ] G5 human gate: Hamza reviews PV names/definitions (table presented 2026-07-02; edits go
      through station 7 manage-change + log_change.py).
- [ ] Triage the 5 standing warnings: 2× I2 (Context: Environment/Economy — add concept or
      ExclusionRationale), 3× I4 (GEN-004/010/015 compound names — split or mark 'I4-ok').
- [ ] P3 remainder: Word loop-table in v1/v2 paper format + v1↔v2↔v3 rename-map appendix
      (use docx skill; loop data in registry Loops sheet, names in Concepts).
- [ ] P4: registry2mdl.py (Vensim .mdl skeleton; sdTypeHint → Level/Rate/Aux/Constant).
- [ ] P5: knowledge-graph spot-check (Fuseki/SPARQL coverage query, Playbook §C6).
- [ ] Optional extras Hamza hasn't picked yet: live validation dashboard artifact,
      weekly scheduled health check, CSV shadow-export for git diffs.

## Known environment quirk

Windows-side file edits (Claude's Edit/Write tools) sometimes arrive truncated or
null-padded in the Linux sandbox mount for pipeline/*.py. Symptom: SyntaxError at
file end. Fix: rewrite the file via bash heredoc (atomic, both sides consistent).
Prefer bash-side writes for pipeline scripts.

## Decisions this session

- Skill architecture: ONE skill (`integrate-domains`) with stations/ procedure files, not 7 skills.
- Scripts live in `pipeline/` (this folder) AND get bundled into the skill.
- Validator regression = current registry passes + seeded-defect fixtures fail.

## Log

- 2026-07-02: Session started. Tasks 1–2 done.
- 2026-07-02: validate_registry.py done. Current registry PASSES with 5 WARN worth triaging with Hamza:
  I2: 'Context: Environment' and 'Context: Economy' blocks have no concept/exclusion.
  I4: GEN-004, GEN-010, GEN-015 have compound 'and' names (suppress with 'I4-ok' in Notes, or split).
- 2026-07-02: regression_test.py done, 11/11 (clean pass + 10 defect classes each caught by the right invariant).
