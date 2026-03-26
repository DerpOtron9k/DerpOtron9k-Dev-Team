# DerpOtron9k Dev Team Agent Guide

This repository is designed to be forked and used as the starting shell for a new AI-assisted development project.

The user is the Product Owner unless they explicitly choose a different model.

## Fork-And-Start Model

- The root of this repo is a starter project shell.
- The default kickoff trigger phrase is:

```text
Start Dev Team Kickoff
```

- At kickoff, the LLM should:
  - inspect the repo state
  - confirm the Product Owner
  - use the starter delivery ring
  - recommend and install any missing project-specific council seats from `Subagent Directory/`
  - create or refine the PRD, epic map, sprint, and continuity files

## Continuity Protocol

- Keep durable continuity in `.codex/council/`.
- Keep shared project and sprint context in `.codex/council/shared-state.md`.
- Each active seat owns its own history file in `.codex/council/`.

## Required Continuity Workflow

- After each meaningful checkpoint, update:
  - the shared state file
  - the history file for each seat that materially contributed
- Keep entries short and cumulative. Prefer dated append-only notes.
- Record:
  - current sprint goal
  - recent decisions
  - unresolved concerns
  - recommended next actions

## Replacement Seat Procedure

When spawning a replacement for a dead or stale seat, the replacement must be instructed to:

1. Read `.codex/council/shared-state.md`.
2. Read its predecessor seat history file in `.codex/council/<seat-name>.md`.
3. Familiarize itself with the prior seat's decisions, concerns, and standing opinions.
4. Continue writing updates to the same seat history file after meaningful work.

Do not spawn replacement seats without providing both the shared state file and the relevant seat history file.

## Delivery Hierarchy

- `.taskmaster/docs/prd.txt` = delivery PRD
- `docs/EPICS.md` = epic and feature map
- `.taskmaster/tasks/` top-level tasks = PBIs / user stories
- `.taskmaster/tasks/` subtasks = implementation tasks
- `docs/SPRINT.md` = active sprint goal and sprint backlog

Keep architecture rationale in `docs/`, not Task Master.
Keep continuity and checkpoint reasoning in `.codex/council/`, not Task Master.

## Starter Delivery Ring

The root repo starts with these delivery-side seats in `.codex/agents/`:

1. `product-manager`
2. `scrum-master`
3. `scrum-coach`

These seats are advisory. They do not override the Product Owner.

## Ceremony Guidance

- Ceremony trigger rules live in [docs/CEREMONIES.md](/R:/GitRepo/DerpOtron9k-Dev-Team/docs/CEREMONIES.md).
- Use the smallest useful ceremony:
  - backlog unclear -> backlog refinement
  - sprint unclear -> sprint planning
  - direction unclear -> Product Owner input, then council if needed

## Subagent Sourcing

- Use [VoltAgent awesome-codex-subagents](https://github.com/VoltAgent/awesome-codex-subagents) as the default upstream catalog for subagent TOML files.
- Do not assume every project should use the same subagent set.
- Use the starter delivery ring for kickoff, then shape the actual council to the project.

## MCP Staples

- Treat Serena and Context7 as default MCP staples for this workflow.
- Use [docs/MCP_STACK.md](/R:/GitRepo/DerpOtron9k-Dev-Team/docs/MCP_STACK.md) and `.codex/config.toml.example` when configuring the project.
- At kickoff, verify whether Serena and Context7 are available before deeper planning continues.
