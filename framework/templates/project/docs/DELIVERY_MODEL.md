# Delivery Model

## Purpose

This project uses a lightweight Scrum-shaped delivery system. The goal is to keep the team organized without turning process into another product.

## Authority

- The user is the Product Owner unless project docs say otherwise.
- The architecture council governs product direction, system boundaries, and quality gates.
- The delivery ring supports planning and execution hygiene.

Delivery roles do not override the Product Owner or the architecture council.

## Artifact Hierarchy

1. `PRD`
   - Canonical delivery brief
   - File: [`.taskmaster/docs/prd.txt`](/__PROJECT_PATH__/.taskmaster/docs/prd.txt)
2. `Epics`
   - Large user-value outcomes spanning multiple PBIs
   - File: [`docs/EPICS.md`](/__PROJECT_PATH__/docs/EPICS.md)
3. `Features`
   - Coherent capability slices within an epic
4. `PBIs / User Stories`
   - Delivery backlog items tracked in Task Master
   - File: [`.taskmaster/tasks/tasks.json`](/__PROJECT_PATH__/.taskmaster/tasks/tasks.json)
5. `Implementation Tasks`
   - Subtasks under active PBIs in Task Master
6. `Sprint`
   - Current sprint goal, in-sprint PBIs, risks, and carryover
   - File: [`docs/SPRINT.md`](/__PROJECT_PATH__/docs/SPRINT.md)

## Delivery Rules

- Top-level Task Master items are PBIs or story-sized delivery items.
- Task Master subtasks are implementation tasks only.
- Do not use Task Master to store architecture rationale or council debates.
- Update continuity files when reasoning changes.
- Update Task Master when delivery state changes.
- Update docs when workflow rules or hierarchy change.

## Default Tooling Assumption

- Serena and Context7 are treated as default MCP staples for code-aware work and current documentation retrieval.

## Definition Of Ready

A PBI is ready when:

- it has a clear user-facing outcome
- it fits an existing epic/feature
- acceptance checks are concrete
- dependencies are known
- the current sprint can realistically absorb it

## Definition Of Done

A PBI is done when:

- implementation is complete in the target workspace
- relevant validation has passed
- Task Master status is updated
- sprint artifact reflects the new state if it affects sprint scope
- continuity files are updated if the checkpoint changed reasoning or backlog direction

## Ceremony Triggers

Detailed checkpoint rules live in [`docs/CEREMONIES.md`](/__PROJECT_PATH__/docs/CEREMONIES.md).
