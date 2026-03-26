# __PROJECT_NAME__ Agent Guide

This repository uses a council-based subagent workflow. The active seats are installed in `.codex/agents`.

The user is the Product Owner. Do not let subagents override the user's priority, acceptance, or scope decisions.

## Council Memory Protocol

- Keep durable continuity in `.codex/council/`.
- Keep shared repo and sprint context in `.codex/council/shared-state.md`.
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

## Delivery Roles

- `product-manager` helps frame epics, features, PBIs, and acceptance criteria.
- `scrum-master` helps keep sprint scope, ceremonies, and impediment handling disciplined.
- `scrum-coach` keeps Task Master, sprint artifacts, and continuity workflow aligned.
- These delivery roles are advisory. They do not override the Product Owner or the architecture council.

## Ceremony Guidance

- Ceremony trigger rules live in [docs/CEREMONIES.md](/__PROJECT_PATH__/docs/CEREMONIES.md).
- Use the smallest useful ceremony:
  - backlog unclear -> backlog refinement
  - sprint unclear -> sprint planning
  - direction unclear -> Product Owner input, then council if needed
- Do not force a ceremony when normal turn-level scrum is sufficient.

## Subagent Sourcing

- Use [VoltAgent awesome-codex-subagents](https://github.com/VoltAgent/awesome-codex-subagents) as the default upstream catalog for subagent TOML files when shaping a new project's council or delivery ring.
- Do not assume every project should use the same subagent set.
- Treat upstream subagents as starting points. Project-specific seats may be adapted locally when needed.

## MCP Staples

- Treat Serena and Context7 as default MCP staples for this workflow.
- Use [docs/MCP_STACK.md](/__PROJECT_PATH__/docs/MCP_STACK.md) and `.codex/config.toml.example` when configuring the project.
- At kickoff, verify whether Serena and Context7 are available before deeper planning continues.
