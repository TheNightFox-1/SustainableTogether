# SustainableTogether Contribution Workflow

This document describes how contributors can pick up issues and contribute to the SustainableTogether project using a structured, low-friction workflow.

## Quick Start

1. **Find an issue** in the [GitHub Project Board](https://github.com/users/TheNightFox-1/projects/3) labeled `good-first-issue` or `help-wanted`
2. **Claim it** by commenting "I'll work on this"
3. **Create a branch**: `git checkout -b issue-#N-brief-title`
4. **Work locally**, commit, push
5. **Open a PR** linking to the issue (title: `#N — [description]`)
6. **Maintainers review** and merge

---

## Issue Structure — Clear Scope & Acceptance Criteria

Every issue should include:

- **Title:** Clear, actionable (e.g., `[Model] Add Logical Architecture for SolarX`)
- **Description:** Problem/goal + scope
- **Acceptance Criteria:** Checklist of what "done" means
- **Labels:** `sysml-model`, `lca-model`, `docs`, `level:product`, `good-first-issue`, `needs-discussion`, `help-wanted`
- **Assignee:** (optional) or open for contribution
- **Linked PR:** Auto-links when contributor opens PR

### Issue Template

```markdown
## Goal
[What does this contribute to the project?]

## Scope
- [ ] Task A
- [ ] Task B
- [ ] Validation in SysIDE / via LCA pipeline / etc.

## Acceptance Criteria
- [ ] [Specific deliverable]
- [ ] [Tested/validated how?]
- [ ] [Documentation updated]

## Context
[References to SYSMOD step, related issues, CLAUDE.md rules, example files]

## Questions?
Comment here to ask for clarification before starting.
```

---

## Project Board — Workflow Columns

The GitHub Project Board tracks progress across five status columns:

| Column | Meaning | What Happens |
|--------|---------|--------------|
| **📋 Backlog** | Issue created, waiting for contributors | No PR yet; ready to be claimed |
| **🚀 Ready to Start** | Clearly scoped, good-first-issue or high priority | Contributor claims and creates branch |
| **🔨 In Progress** | Someone is actively working (linked PR exists) | Draft or open PR under review |
| **👀 In Review** | PR open, waiting for maintainer feedback | Reviewer provides feedback |
| **✅ Done** | PR merged, issue closed | Released and available in main |

### Automation

- Issue created → moves to **Backlog**
- PR opened against issue → moves to **In Progress**
- PR marked ready-for-review → moves to **In Review**
- PR merged → moves to **Done** (issue auto-closes)

---

## Claiming an Issue — How It Works

### For Contributors

1. Browse the [Project Board](https://github.com/TheNightFox-1/SustainableTogether/projects/3) and find an issue in **Backlog** or **Ready to Start**
2. **Comment on the issue:** `"I'll work on this"` or `"claiming this"`
3. **Assign yourself** to the issue (or maintainer will assign you)
4. **Create a local branch:**
   ```bash
   git checkout main && git pull
   git checkout -b issue-#N-brief-title
   # Example: issue-#4-logical-architecture
   ```
5. **Work locally:**
   - Make changes
   - Validate in SysIDE (for SysML), or run LCA pipeline, etc.
   - Commit with clear messages: `Issue #N: what you did`
   - Push: `git push origin issue-#N-brief-title`
6. **Open a Pull Request:**
   - Title: `#N — Brief description`
   - Body: Use the PR template (see below)
   - Link to issue: `Closes #N`
7. **Wait for review** — maintainers will provide feedback
8. **Address feedback** in follow-up commits (rebase if requested)
9. **Merged!** Issue auto-closes, you're credited

### For Maintainers

- Reply to "I'll work on this" with encouragement and context
- Label issues `help-wanted` if they need guidance before starting
- Review PRs within SLA (see Review Process below)

---

## Pull Request Requirements

### PR Template (in `.github/pull_request_template.md`)

```markdown
## Issue
Closes #[issue number]

## What Changed
[Brief description of your changes]

## Validation
- [ ] SysML syntax validated in SysIDE (paste errors if any)
- [ ] Follows CLAUDE.md confirmed syntax rules
- [ ] Added/updated documentation if needed
- [ ] Ran LCA pipeline if applicable
- [ ] Full model file validates (no broken references)

## Testing
[How did you test this? Manual validation, unit tests, etc.]

## Context
[Any design decisions, tradeoffs, or questions for the reviewer?]

## Checklist
- [ ] Commit messages are clear
- [ ] No breaking changes to existing model
- [ ] Related issues are linked
```

### Validation Checklist

Before opening a PR, ensure:
- ✅ **SysML syntax** — validate in SysIDE (Ctrl+Shift+M shows Problems panel)
- ✅ **CLAUDE.md rules** — review Confirmed Syntax Rules section
- ✅ **No broken references** — the full `.sysml` file must be syntactically valid
- ✅ **Documentation** — updated CLAUDE.md or added comments if a new pattern
- ✅ **LCA pipeline** — if you modified components, run the pipeline (if applicable)
- ✅ **Preserves prior model** — unless explicitly told to overwrite, append to existing content

---

## Labels — Prioritization & Difficulty

### Priority

- 🔴 **`priority:high`** — blocks other work, critical path
- 🟡 **`priority:medium`** — important, can wait a few days
- 🟢 **`priority:low`** — nice-to-have, lowest priority

### Difficulty / Audience

- 🟩 **`good-first-issue`** — clear scope, self-contained, no deep domain knowledge needed
- 🟨 **`intermediate`** — requires some SysML/LCA/domain knowledge
- 🟥 **`advanced`** — requires deep expertise or needs design RFC first

### Status / Flags

- 🤔 **`needs-discussion`** — unclear scope, team needs to align before starting
- 💬 **`needs-clarification`** — contributor has questions
- 🔗 **`blocked-by-#N`** — depends on another issue (link in title/body)
- ⏸️ **`on-hold`** — paused, waiting for blocker resolution

---

## Review Process — Expectations & SLA

### Review Timeline

- **`good-first-issue`** → review within **48 hours**
- **`intermediate`** → review within **1 week**
- **`advanced`** → discuss in issue first (RFC), then review

### Reviewer Checklist

- [ ] SysML syntax is valid (no SysIDE errors)
- [ ] Follows CLAUDE.md confirmed syntax rules
- [ ] Doesn't break existing model (validate full file)
- [ ] Well-documented (comments on non-obvious logic, doc blocks)
- [ ] PR description clearly explains the why, not just the what
- [ ] Acceptance criteria from issue are met
- [ ] Related issues are linked

### Feedback & Iteration

- Reviewer provides feedback as comments
- Contributor makes changes in new commits (don't force-push, keep history)
- Reviewer approves when ready
- Maintainer merges and closes issue

---

## Contribution Guidelines — Before You Start

### Read This First

1. **[CLAUDE.md](../Claude-for-SysML-v2/CLAUDE.md)** — SysML v2 syntax rules, SYSMOD patterns, known problem areas
2. **[CONTRIBUTING.md](../CONTRIBUTING.md)** — this file
3. **Validated examples** — browse `_reference/core/` to see correct patterns

### For SysML Model Work

- Validate in **SysIDE** (VS Code extension)
- Paste any errors from the Problems panel (Ctrl+Shift+M) into GitHub issue comments
- Reference the **SYSMOD methodology** steps (Problem → System Idea → Stakeholders → Requirements → Context → Use Cases → Functional → Logical → Physical)
- Use **short names in angle brackets** for identifiers with special characters: `<'REQ-F1'>`, `<'UC-1'>`

### For LCA Work

- Use the **SimpleLCAIntegration2 pipeline** to validate LCA flows
- Document which ELCD flows were used and any unresolved elementary flows
- Reference the **SysML component** in your LCA analysis comments

### For Documentation

- Use **Markdown** (`.md` files)
- Link to specific issues/PRs using `#123` syntax
- Keep prose clear and scannable (short paragraphs, bullet points)

---

## Questions?

- **Unclear issue scope?** Comment in the issue — don't start guessing
- **Syntax error?** Paste from SysIDE Problems panel (Ctrl+Shift+M) into the issue/PR
- **Stuck on design?** Label the issue `needs-discussion` and wait for team input
- **Questions during PR review?** Reply in PR comments — don't make assumptions

---

## Example Workflow

### Scenario: Contributing the Logical Architecture

1. **Find issue:** #4 `[Model] Add Logical Architecture for SolarX`
2. **Comment:** "I'll work on this"
3. **Create branch:** `git checkout -b issue-4-logical-architecture`
4. **Work:**
   - Read `_reference/core/structure/` for examples
   - Read CLAUDE.md Logical Architecture section
   - Add `part def` for each subsystem (9 total)
   - Add `perform action` links to Step 7 functions
   - Add ports mirroring system context boundary
   - Validate in SysIDE — no errors
5. **Commit:**
   ```bash
   git add SolarXModel.sysml
   git commit -m "Issue #4: Add logical architecture with 9 subsystems and perform action links"
   ```
6. **Push & PR:**
   ```bash
   git push origin issue-4-logical-architecture
   # Open PR in GitHub, use template, link to #4
   ```
7. **Review:** Maintainer reviews, asks for changes if needed
8. **Merged:** Issue auto-closes, you're done!

---

## Session Workflow (for Claude)

Each collaboration session follows this pattern:

1. **Read context** — load previous session notes, project memory, and current GitHub issues
2. **Pick an issue** — select from `Backlog` or `Ready to Start` in the project board
3. **Work on it** — implement the issue, validate, commit, create or update PR
4. **Document progress** — at end of session, update the issue with what was completed
5. **Close or update** — if done, close the issue; if partial, move to next column and document blockers

---

**Last updated:** 2026-04-18
