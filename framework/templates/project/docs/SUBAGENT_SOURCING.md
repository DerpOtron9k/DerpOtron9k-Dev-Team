# Subagent Sourcing

## Default Upstream Source

Use [VoltAgent awesome-codex-subagents](https://github.com/VoltAgent/awesome-codex-subagents) as the default upstream catalog for subagent TOML files.

## Selection Rule

Do not install a fixed universal council into every project.

Choose subagents based on:

- product type
- technical stack
- delivery phase
- current sprint risks
- need for architecture, design, QA, or process support

## Recommended Layering

1. core governance seats
2. delivery seats
3. project-specific overlays

## Continuity Rule

Every active seat should have a continuity file in `.codex/council/`.
