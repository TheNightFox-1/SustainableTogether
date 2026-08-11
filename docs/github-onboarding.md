# GitHub Onboarding for Beginners

New here and never used GitHub? You are in the right place. This guide gets you from "I have no idea what a repository is" to making your first contribution, no programming background required.

!!! tip "You do not need to be a developer"
    GitHub is, at heart, a shared folder with a memory. It stores files, remembers every change, and lets a group work on the same material without overwriting each other. Many of our most valuable contributions are text, presentations, and research, not code. If you can edit a document, you can contribute here.

---

## How GitHub works in one minute

Think of it like a shared kitchen with a logbook:

- The **repository** ("repo") is the kitchen: all the files and their full history.
- A **branch** is your own copy of the worktop, so you can cook without disturbing the main dish.
- A **commit** is a saved step with a note: "added the sauce."
- A **pull request** ("PR") is you saying "I think my version is better, please taste it and add it to the main dish."
- An **issue** is a note on the fridge: "we need someone to make dessert."

You propose changes on your own branch, others review them, and once approved they get merged into the shared version. Nothing you do can break the main copy by accident — that is the whole point of the design.

---

## Glossary (the only six words you need)

| Term | Plain meaning |
|---|---|
| **Repository (repo)** | The project: all files plus their complete change history. |
| **Issue** | A task, question, or idea written up so anyone can pick it up. |
| **Branch** | Your safe workspace to change files without affecting the main version. |
| **Commit** | One saved change with a short message describing it. |
| **Pull Request (PR)** | A request to merge your branch's changes into the main version, after review. |
| **Fork** | Your own copy of the whole repo under your account (only needed if you are not added as a collaborator). |

---

## Onboarding checklist

Work through this once. Tick each item as you go.

**Set up your account**

- [ ] Create a free account at [github.com](https://github.com/signup)
- [ ] Turn on **two-factor authentication** (Settings → Password and authentication) — GitHub requires it for contributors
- [ ] Add a name and photo to your profile so the team knows who you are

**Get to know the project**

- [ ] Read the [Onboarding Document](https://github.com/TheNightFox-1/SustainableTogether/blob/main/On-Boarding%20SustainableTogether%20and%20INCOSE%20Sustianability%20WG.pdf) — what SustainableTogether and the INCOSE Sustainability WG are about
- [ ] Skim the [home page](index.md) — the vision and the two ways to contribute
- [ ] Open the repo at [github.com/TheNightFox-1/SustainableTogether](https://github.com/TheNightFox-1/SustainableTogether) and click **Watch** (top right) to get updates
- [ ] Look at the [Project Board](https://github.com/users/TheNightFox-1/projects/3) to see what is being worked on

**Learn the basics you will actually use**

- [ ] Understand the six terms above (repository, issue, branch, commit, PR, fork)
- [ ] Know how to find and read an **issue**
- [ ] Know how to leave a **comment** on an issue or PR
- [ ] Pick one of the three working methods below and get it set up

**Make your first contribution** — the onboarding exercise

- [ ] **Raise an issue** with the "I'm on board 👋" template to introduce yourself
- [ ] Wait for a maintainer to say hello and confirm
- [ ] **Add a row about yourself** to the [onboarding wall](onboarding-roster.md)
- [ ] **Open a pull request** that closes your issue with `Closes #N`
- [ ] Respond to any review comments — then watch it get merged and your name appear

If you get stuck at any step, that is normal. Open a [Discussion](https://github.com/TheNightFox-1/SustainableTogether/discussions) and ask. Asking early is welcome here.

---

## Why you raise an issue first

The first thing you do here is not edit a file — it is **raise an issue**. An issue is where you describe what you want to contribute *before* you do the work. It gives the team a chance to point you in the right direction, prevents two people doing the same thing, and gives your later pull request something to link to.

!!! note "Why raise an issue first?"
    It turns a private idea into a visible, trackable piece of work. Maintainers can guide you before you invest time, and your contribution becomes part of the project's shared history — not a surprise.

---

## Your first contribution: add yourself to the wall

The best way to learn GitHub is to use it on something real and low-stakes. So your first contribution is to **add yourself to the [onboarding wall](onboarding-roster.md)** — a shared list of everyone who has joined. Doing it takes you through the entire workflow once, start to finish.

You can do every step **in your browser** (method A) — no installs needed.

**Step 1 — Raise your onboarding issue**

1. Go to **[New issue](https://github.com/TheNightFox-1/SustainableTogether/issues/new/choose)** and choose the **"I'm on board 👋"** template.
2. Introduce yourself: your name, a line about your background, and what brings you here.
3. Click **Submit new issue**. Note its number — that is your `#N`.

A maintainer will say hello and confirm. Now you have an issue to close.

**Step 2 — Add your row to the wall**

1. Open **[docs/onboarding-roster.md](onboarding-roster.md)** and click the **pencil icon** (✏️ Edit this file).
2. Add one row to the table, just above the `<!-- add your row above this line -->` marker, keeping the same `| Name | Role | Country | What brings me here |` format.
3. Below the editor, write a commit message like `Add: <your name> to onboarding wall`.
4. Choose **"Create a new branch for this commit and start a pull request"** and click **Propose changes**.

**Step 3 — Open the pull request**

1. On the next screen, in the description write `Closes #N` (your issue number from Step 1).
2. Click **Create pull request**.

That is it — you have raised an issue, made a change on a branch, committed it, and opened a PR, entirely in the browser. A maintainer reviews and merges, your issue closes automatically, and your name is on the wall. You now know the core GitHub loop and can repeat it for any real contribution.

!!! tip "Prefer the app or local Git?"
    You can do the same exercise with **GitHub Desktop** (method B) or a **local clone** (method C) — clone the repo, create a branch, edit `docs/onboarding-roster.md`, commit, push, and open the PR. Same loop, different tool.

---

## Three ways to use GitHub

There is no single "right" way. Pick the one that matches what you want to do. You can change later, or use different methods for different tasks.

### A. In your web browser — easiest, nothing to install

Everything happens on [github.com](https://github.com). You edit files directly in the browser, and GitHub handles the branch and commit for you.

**Best for:** editing documentation, fixing typos, writing or commenting on issues, reviewing other people's work. The fastest way to make your first contribution.

**What you need:** just a GitHub account and a browser.

**To edit a file:**

1. Open the file in the repo on github.com.
2. Click the **pencil icon** (✏️ Edit this file) at the top right.
3. Make your changes in the editor.
4. At the bottom, write a short description of what you changed.
5. Choose **"Create a new branch for this commit and start a pull request."**
6. Click **Propose changes**, then **Create pull request**.

That is a complete contribution, done entirely in the browser. The Material docs site also has an **edit pencil** on every page that takes you straight here.

### B. GitHub Desktop — visual app, no command line

[GitHub Desktop](https://desktop.github.com) is a free app that gives you buttons instead of commands. You work with files on your own computer and use the app to save and send your changes.

**Best for:** working on several files at once, or anyone who wants their own local copy without typing commands. A comfortable middle ground.

**What you need:** install [GitHub Desktop](https://desktop.github.com) and sign in.

**To get started:**

1. In the app: **File → Clone repository → URL**, paste `https://github.com/TheNightFox-1/SustainableTogether`, and choose a local folder. ("Clone" = download your own working copy.)
2. Click **Current branch → New branch**, name it (e.g. `fix-readme-typo`), and base it on `main`.
3. Edit the files on your computer with whatever program you like (Word, VS Code, a text editor).
4. Back in the app, your changes appear on the left. Write a summary at the bottom and click **Commit to <your-branch>**.
5. Click **Push origin** to upload your branch.
6. Click **Create Pull Request** — it opens the browser to finish.

### C. Local folder with Git — for the SysML model and LCA work

This is the classic developer setup: a copy of the repo on your machine, driven by Git through VS Code or a terminal. It is the only method that lets you run the engineering tools.

**Best for:** working on the **SysML v2 model** (needs the SysIDE validator) or the **LCA pipeline** (needs Python + openLCA). The required path for our model contributors.

**What you need:** [Git](https://git-scm.com/downloads), [VS Code](https://code.visualstudio.com), and the **SysIDE** extension for SysML work.

**Typical flow (in the VS Code terminal):**

```bash
# One-time: download your own copy
git clone https://github.com/TheNightFox-1/SustainableTogether.git
cd SustainableTogether

# Each task: start from a fresh, up-to-date main
git checkout main && git pull origin main
git checkout -b issue-#N-brief-title

# ...edit files, validate the model in SysIDE (Ctrl+Shift+M)...

git add .
git commit -m "Issue #N: what you changed"
git push origin issue-#N-brief-title
```

Then open the pull request on github.com. The full engineering workflow, validation rules, and PR checklist are in **[CONTRIBUTING.md](contributing.md)**.

---

## Which method for which task

| I want to... | Recommended method |
|---|---|
| Fix a typo or edit documentation | **A — browser** |
| Write or comment on an issue | **A — browser** |
| Add a presentation or several files | **B — GitHub Desktop** |
| Work on the **SysML v2 model** | **C — local + VS Code + SysIDE** |
| Run or extend the **LCA pipeline** | **C — local + Python + openLCA** |
| Just ask a question | No setup — open a [Discussion](https://github.com/TheNightFox-1/SustainableTogether/discussions) |

---

## Learning resources

Short, trustworthy, and beginner-friendly. Start with GitHub Skills if you like learning by doing.

**GitHub basics**

- [GitHub Skills](https://skills.github.com) — free, interactive, hands-on courses. The best starting point.
- [GitHub Quickstart (Hello World)](https://docs.github.com/en/get-started/quickstart/hello-world) — your first repo, branch, and PR in 10 minutes.
- [GitHub Docs — Get started](https://docs.github.com/en/get-started) — the official manual.

**The three methods**

- [Editing files on GitHub](https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files) — method A.
- [GitHub Desktop documentation](https://docs.github.com/en/desktop) — method B.
- [Git Handbook](https://docs.github.com/en/get-started/using-git/about-git) and [git-scm Book (free)](https://git-scm.com/book) — method C.

**Pull requests and collaboration**

- [About pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
- [GitHub Glossary](https://docs.github.com/en/get-started/learning-about-github/github-glossary) — every term, defined.

---

## Where to go next

Once you are set up, **[CONTRIBUTING.md](contributing.md)** is your home base: it explains the two contribution paths (concrete issues vs. ongoing WG workstreams), the issue labels, and the review process. Raise an issue for what you want to work on, take it through to a pull request, and you are contributing.

Welcome aboard. Everyone is welcome here, and every skill is needed.
