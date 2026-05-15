# Annotated Guide to the SustainableTogether SysML Model

> A non-engineer's guide to understanding the system architecture.

## What is SysML?

SysML (Systems Modeling Language) is a visual language used to describe complex systems. Think of it as a blueprint that shows how different parts of our platform work together.

## The Big Picture

SustainableTogether is a platform that connects communities with sustainability goals. Here's how the pieces fit:

```
┌─────────────────────────────────────────────────┐
│                   Users                          │
│  (Community Members, Orgs, Admins)               │
└─────────────┬───────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────────────────┐
│              Web Application                     │
│  (React Frontend + Mobile App)                   │
└─────────────┬───────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────────────────┐
│              API Gateway                         │
│  (Routes requests, handles auth)                 │
└─────────────┬───────────────────────────────────┘
              │
    ┌─────────┼──────────┐
    ▼         ▼          ▼
┌────────┐ ┌───────┐ ┌──────────┐
│ Goals  │ │Events │ │Resources │
│Service │ │Service│ │ Service  │
└────────┘ └───────┘ └──────────┘
    │         │          │
    └─────────┼──────────┘
              ▼
┌─────────────────────────────────────────────────┐
│              Database                            │
│  (PostgreSQL - stores all data)                  │
└─────────────────────────────────────────────────┘
```

## Key Components Explained

### 1. Users Block
**What it represents:** The people who use the platform.

| Actor | What they do |
|-------|-------------|
| Community Members | Set goals, join events, share resources |
| Organizations | Create campaigns, sponsor events |
| Administrators | Manage platform, review content |

### 2. Goals Service
**What it represents:** The sustainability goals that communities set.

- Each goal has a **target** (e.g., "Reduce carbon emissions by 20%")
- Goals have **milestones** (checkpoints along the way)
- Progress is **tracked** and displayed to members

### 3. Events Service
**What it represents:** Community events like cleanups, workshops, or planting days.

- Events have **dates, locations, and capacity**
- Members can **RSVP** and track attendance
- Events can be **linked to goals** to show impact

### 4. Resources Service
**What it represents:** Shared resources like tools, guides, and knowledge.

- Resources can be **documents, links, or physical items**
- Members can **contribute and borrow**
- **Categories** help organize resources by topic

## Data Flow

When a community member sets a new goal:

1. **User clicks "Create Goal"** → Frontend sends request to API Gateway
2. **API Gateway validates** → Checks user is authenticated
3. **Goals Service processes** → Creates goal record in database
4. **Notification sent** → Community members are notified
5. **Dashboard updates** → New goal appears on community page

## Glossary

| Term | Simple Definition |
|------|------------------|
| API | A way for software to talk to other software |
| Authentication | Proving who you are (login) |
| Database | Where all information is stored |
| Frontend | What you see in your browser |
| Service | A specialized program that handles one type of task |
| Milestone | A checkpoint showing progress toward a goal |

## Questions?

If you're still confused about any part of the model, please open an issue with the "question" label. We're happy to explain further!
