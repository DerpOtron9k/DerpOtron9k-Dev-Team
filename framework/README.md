# Framework

This directory contains the reusable governance layer that can be installed into another development project.

## Contents

- `bootstrap/`
  - scripts that initialize a target project
- `templates/`
  - starter docs and continuity files
- `overlays/`
  - project-governance seats that are intentionally layered on top of the upstream catalog

## Installation Model

The intended model is:

1. choose upstream seats from `Subagent Directory/`
2. add any overlay seats from `framework/overlays/`
3. copy governance and ceremony templates into the target project
4. initialize Task Master in the target project

## Notes

- This framework is intentionally lightweight.
- It is designed for AI-assisted engineering projects, not generic corporate project management.
- The user remains the Product Owner in the target project unless they choose a different model.
- Use [prompts/START_PROJECT_KICKOFF.md](/R:/GitRepo/DerpOtron9k-Dev-Team/framework/prompts/START_PROJECT_KICKOFF.md) as the standard initial project-start ritual.
- Serena and Context7 are treated as default MCP staples and are documented in the project templates.
