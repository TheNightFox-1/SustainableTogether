# Getting started

For anyone opening this folder for the first time. No prior knowledge assumed. You do not need
to know git, Obsidian, Python, or anything about AI tooling to follow this.

---

## 1. What this is, in plain terms

We have a lot of knowledge sitting in PDFs: papers, webinar decks, reviews. Today, every time
someone has a question, they open the PDFs again and read. The reading gets thrown away. The
next person starts from zero.

An LLM-Wiki changes what gets kept. An AI agent reads the PDFs once and writes a small
encyclopedia about them: one page per concept, every sentence carrying a reference to the PDF
and page it came from. Ask a question, and you read the encyclopedia instead of the PDFs. Add
a new PDF, and the agent goes back and updates every page that source affects.

The knowledge builds up instead of resetting.

**One rule makes the whole thing safe: the agent writes, a person approves.** Nothing in this
folder counts as working group knowledge until a named WG member signs it off. Right now
nobody has, so nothing here is approved. That is deliberate.

## 2. The one idea worth remembering

Think of it the way a programmer thinks about code:

| | Programming | Here |
|---|---|---|
| What you write | Source code | The PDFs |
| What gets built | The running program | The wiki pages |
| Who builds it | The compiler | The AI agent |

You never edit the built program by hand. You change the source and build again. Same here:
the PDFs are never touched, and the wiki can always be thrown away and rebuilt from them.
That is why it is safe to let an agent own the wiki.

## 3. Open it

**To look at it:** double-click `llm-wiki-demonstrator.html`. It opens in any browser. Nothing
to install, no internet needed, nothing runs in the background.

**To read the actual files:** open `wiki/index.md` in any text editor, or in VS Code, or on
GitHub. The wiki is only text files. If every tool we use today disappeared, the knowledge
would still be readable.

Those are the same content. The HTML page is a nicer way to browse it.

## 4. A tour, in the order that makes sense

The page has six tabs across the top. Take them in this order.

**How it works.** Start here if the idea is new to you. Three layers, three things the agent
does, and why a person has to approve pages. Two minutes of reading.

**The wiki.** The thing itself. The left column lists the pages, the middle shows the one you
picked, the right shows where its knowledge came from.

Open `regeneration.md` first. It is the clearest example of why this is worth doing: three
different fields use the word "regeneration" to mean three different things, and the page
keeps all three separate instead of blending them into one vague definition.

Then open `strong-sustainability.md`. Two of our own webinar episodes define sustainability in
ways that cannot both be right. The page says so, cites both, and marks the pages that are
stuck until the WG decides.

**Ingest.** Press *Run ingest R11* and watch. This is what happens when one new PDF is added:
the agent reads it, writes a summary page, then goes back and revises five existing pages,
notices a contradiction, and opens a question for the WG. That revising step is the whole
point. Without it you just get a pile of summaries.

**Contested.** Five real disagreements found in our own material. The wiki never picks a
winner. It writes both positions down with their sources and asks us to decide.

**Lint.** An automatic health check. Look at the box titled *Six warnings from one typo*: one
PDF prints its own publication year wrongly, and the check flags all six pages that depend on
it. That is the risk of this approach made visible, which is the honest reason to trust it.

**Log.** A diary of everything the agent did and when. Nothing happens invisibly.

## 5. How to read a wiki page

Every page opens with a grey block in a typewriter font. That is the page's own record card.

```
type: Concept              what kind of page this is
title: Regeneration        what it is about
status: in-review          how far through approval it is  (see below)
sources: [R01, R02, R03]   which PDFs it was built from
timestamp: 2026-08-05      when it was last written
reviewed_by: ""            who approved it. Empty means nobody.
revalidate_after: ...      when it should be checked again
```

Below that is the page text. Two things in it are worth knowing:

- **Green tags like `R03 p.529`** are references. The page is telling you exactly which PDF and
  which page a statement came from. Every claim has one. If a sentence has no tag, it is not
  making a factual claim.
- **Orange tags marked `WG`** mean the opposite: this is our own judgement, not something any
  source said. Marked so nobody mistakes an opinion for a finding.

Greyed-out links point to pages nobody has written yet. Click one to see what happens. It is
not a broken link, it is a to-do item.

## 6. The five statuses

Coloured dots next to each page name in the left column.

| Status | Means |
|---|---|
| `draft` | The agent wrote it. Nothing has checked it. |
| `in-review` | A second AI, with no memory of writing it, is checking every claim against its source. |
| `lint-clean` | The automatic checks passed. |
| `published` | **A named WG member read it and approved it.** Only this counts. |

The agent can set the first three. It is forbidden from setting the fourth. Only a person can
publish, and their name goes in the file.

## 7. Run the health check yourself

You need Python installed. Nothing else, no downloads, no accounts.

Open a terminal in this folder and type:

```
python lint/lint.py
```

You get something like:

```
lint · 23 pages · 14 sources · 2026-08-05
  0 error · 13 warn · 12 info
  publish gate: open
```

What those mean:

- **error**: something is broken. A page cites a PDF that is not in our list, or claims to be
  approved without a name on it. Zero errors is the goal.
- **warn**: something needs a person. A source has an unresolved problem, or a page is
  missing its summary.
- **info**: notes, not problems. Mostly links to pages nobody has written yet.

Run it again and you get exactly the same answer. There is no AI involved in this step, just a
script, which is why it can be trusted as a gate.

## 8. Add a source yourself

Say you want the wiki to know about a new paper.

1. Put the PDF wherever it belongs in the repository. Do not copy it in here.
2. Open `raw/registry.md` and add a row: an ID like `R15`, the title, the path, and the word
   `curated`.
3. Tell the agent: `ingest R15`.
4. Read what it did in `wiki/log.md`, and read the pages it changed.
5. If a page is right, put your name in its `reviewed_by` field and set `status: published`.

Step 2 matters more than it looks. The agent is not allowed to go and find its own sources. A
person decides what enters the corpus. That is the first of the safety rules.

## 9. The rules that keep it honest

All of them live in `CLAUDE.md`, which is five minutes of reading and is worth the five
minutes. The short version:

- The agent reads the PDFs. It never edits them.
- Every factual sentence carries a reference. No reference, no claim.
- Where sources disagree, both go in the page. The agent is forbidden from inventing a
  compromise definition that neither source holds.
- The agent cannot approve its own work, and cannot correct a citation on its own. When it
  found a PDF printing its year as 2112, it flagged it and stopped.
- Nothing is trusted until a person's name is on it.

Change `CLAUDE.md` and the behaviour changes the next time the agent runs. The rules are not
buried in a tool. They are one file we control.

## 10. Questions people ask

**Can the AI make things up?**
Yes, and this is the real risk. A wrong answer in a chat window disappears when you close it.
A wrong page here becomes a fact that other pages cite. That is exactly why every claim carries
a reference, why a second AI checks the first one's work, why a script runs the mechanical
checks, and why a person has the final say. Four checks, because one is not enough.

**Do I need to trust the AI?**
No. That is the design. Every sentence tells you which PDF and page it came from, so you can
check it. If you disagree with a page, you do not approve it.

**What if we stop using this?**
You still have the PDFs, unchanged, and a folder of plain text files anyone can read. There is
nothing to migrate away from and no subscription to keep paying.

**Does it lock us into one AI company?**
No. The wiki format is an open standard called OKF: text files with a short header. Any model
can read and write it.

**What if the agent gets something wrong?**
Every change is recorded, so we can see what changed, when, and why, and undo it.

**Is anything here approved?**
No. Zero pages are published. This is a demonstration built in an afternoon, meant to be looked
at and argued with, not cited.

## 11. What is in this folder

```
demonstrator/
  llm-wiki-demonstrator.html   the browsable version. Start here.
  GETTING-STARTED.md           this file
  README.md                    the short version, for presenting

  CLAUDE.md                    the rules the agent follows
  raw/registry.md              the list of PDFs, and where they live
  wiki/                        the knowledge itself
    index.md                   contents page
    log.md                     diary of everything the agent did
    concepts/                  one page per idea
    entities/                  one page per named thing: a tool, a benchmark
    sources/                   one page per PDF: what it argues, how to handle it
    questions/                 things the sources do not settle, for the WG to decide
  lint/lint.py                 the automatic health check
```

Everything is text. Everything can be read without this folder's software, and rebuilt without
its knowledge.
