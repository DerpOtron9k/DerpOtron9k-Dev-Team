# DerpOtron9k Dev Team

Reusable AI-assisted agile delivery framework built around:

- a Codex subagent catalog
- project-shaped councils and delivery rings
- continuity files for durable agent handoff
- Task Master as the delivery-layer backlog system

## Repository Layout

### `Subagent Directory/`

Upstream-style Codex subagent catalog, currently based on the VoltAgent collection:

- default upstream source for reusable subagent TOML files
- not every project should install every seat
- projects should select a council and delivery ring based on stack, risk, and product needs

### `framework/`

Reusable governance package for new projects:

- bootstrap script
- project templates
- project-specific overlay seats

## What This Adds On Top Of The Catalog

This repo is not just a subagent directory. It also packages a reusable working model for:

- Product Owner driven prioritization
- architecture council governance
- delivery-ring support roles
- sprint planning and backlog refinement triggers
- continuity logging for seat replacement
- Task Master boundary rules
- Serena and Context7 as default MCP staples

## Primary Workflow: Fork And Start

This repository is designed to be forked and then used as the starting point for a new AI-assisted development project.

After forking:

1. rename the repository as needed
2. open it in Codex
3. review the root starter files:
   - [AGENTS.md](/R:/GitRepo/DerpOtron9k-Dev-Team/AGENTS.md)
   - [docs/COUNCIL.md](/R:/GitRepo/DerpOtron9k-Dev-Team/docs/COUNCIL.md)
   - [docs/MCP_STACK.md](/R:/GitRepo/DerpOtron9k-Dev-Team/docs/MCP_STACK.md)
   - [docs/SPRINT.md](/R:/GitRepo/DerpOtron9k-Dev-Team/docs/SPRINT.md)
4. restart or refresh Codex if needed so the starter delivery seats in `.codex/agents/` are active
5. start the project with the kickoff trigger phrase:

```text
Start Dev Team Kickoff
```

Recommended alias:

```text
Run project kickoff
```

The fork-and-start path is the primary user experience for this repository.

## Secondary Workflow: Bootstrap Another Repo

If you already have an existing project repo and want to install this governance model into it, use the bootstrap script.

## Bootstrap Quick Start

1. Choose a target project repo.
2. Pick the seats you want from `Subagent Directory/`.
3. Run the bootstrap script:

```powershell
.\framework\bootstrap\Initialize-DevTeamProject.ps1 `
  -TargetProjectPath "R:\GitRepo\MyProject" `
  -ProjectName "My Project" `
  -CouncilSeats @(
    "architect-reviewer",
    "ui-designer",
    "api-designer",
    "qa-expert"
  ) `
  -DeliverySeats @(
    "product-manager",
    "scrum-master"
  ) `
  -IncludeScrumCoach
```

The bootstrap will:

- create `.codex/agents/`
- create `.codex/council/`
- copy selected seat TOMLs from `Subagent Directory/`
- add a project-specific `scrum-coach` overlay if requested
- create governance and ceremony docs
- seed MCP stack guidance and a `.codex/config.toml.example`
- seed a starter Task Master PRD at `.taskmaster/docs/prd.txt`

## How To Use

After forking this repo or bootstrapping a target project:

1. open the target repo in Codex
2. review the generated `AGENTS.md`, `docs/COUNCIL.md`, and `docs/SPRINT.md`
3. review `docs/MCP_STACK.md` and `.codex/config.toml.example`
4. restart or refresh Codex if needed so newly installed project agents are available
5. start the project with the kickoff trigger phrase:

```text
Start Dev Team Kickoff
```

Recommended alias:

```text
Run project kickoff
```

## What The LLM Should Do At Kickoff

When the user says `Start Dev Team Kickoff`, the LLM should:

1. inspect the repo and current project state
2. identify or confirm the Product Owner
3. confirm whether the project is new, inherited, or mid-stream
4. propose the right council seats from `Subagent Directory/`
5. confirm or install the delivery ring
6. establish or refine:
   - product framing
   - non-goals
   - architecture boundaries
   - initial epic map
   - starter PRD
   - current sprint or first sprint proposal
7. initialize or refine Task Master usage
8. create or update continuity files and kickoff checkpoint memory

The kickoff should produce:

- a usable PRD
- a council and delivery ring
- a first epic map
- a sprint goal or a recommendation to refine backlog first
- explicit Product Owner decisions that still need confirmation

## Kickoff Prompt File

Use the reusable kickoff guide in:

- [framework/prompts/START_PROJECT_KICKOFF.md](/R:/GitRepo/DerpOtron9k-Dev-Team/framework/prompts/START_PROJECT_KICKOFF.md)

This is the packaged instruction set for the initial project-start phase.

## Default Model

The intended reusable hierarchy is:

1. PRD
2. Epics / Features
3. PBIs / User Stories
4. Implementation subtasks
5. Current sprint

Artifact ownership:

- `.taskmaster/` = delivery state
- `.codex/council/` = continuity and checkpoint memory
- `docs/` = workflow rules, architecture, and delivery model

## Default Upstream Source

Use [VoltAgent awesome-codex-subagents](https://github.com/VoltAgent/awesome-codex-subagents) as the default upstream catalog when adding or changing seat TOMLs.

This repository keeps that catalog local under `Subagent Directory/`, then layers reusable governance on top.

## Project-Specific Overlays

Some seats should stay project-specific. This repo includes a reusable `scrum-coach` overlay because generic catalogs usually do not know:

- where continuity lives
- how Task Master is used
- what the Product Owner / council split is

Use overlays when a generic upstream seat is not enough.

## Default MCP Staples

This model treats these as standard tools for AI development work:

- [Serena](https://github.com/oraios/serena) for semantic code retrieval and editing
- [Context7](https://github.com/upstash/context7) for current library and framework documentation
- Task Master for delivery-layer PRD and backlog state

See:

- [docs/MCP_STACK.md](/R:/GitRepo/DerpOtron9k-Dev-Team/docs/MCP_STACK.md)
- [.codex/config.toml.example](/R:/GitRepo/DerpOtron9k-Dev-Team/.codex/config.toml.example)

## Root Starter Shell

The repo root now includes a minimal starter shell for new projects:

- root-level governance docs
- root-level `.taskmaster/docs/prd.txt`
- root-level continuity files
- a starter delivery ring in `.codex/agents/`:
  - `product-manager`
  - `scrum-master`
  - `scrum-coach`

The kickoff should use those seats first, then shape the actual architecture council for the specific project by selecting additional TOMLs from `Subagent Directory/`.
