# Game-Dev Overlay Seats

Reference example only.

This overlay set is not active project direction by itself. It becomes relevant only if the Product Owner explicitly chooses a game-development direction.

These overlay seats extract the Unreal/Codex report into reusable manifests.

Use them together with the upstream catalog in [Subagent Directory](/R:/GitRepo/DerpOtron9k-Dev-Team/Subagent%20Directory), not instead of it.

## Reuse From Upstream

- `product-manager`
- `scrum-master`
- `scrum-coach`
- `game-developer`
- `ui-designer`
- `qa-expert`
- `test-automator`
- `performance-engineer`
- `tooling-engineer`

## Add From This Overlay Set

- `level-designer`
- `environment-artist`
- `gameplay-scripter`
- `shader-creator`
- `animation-retargeter`
- `dialogue-writer`
- `behavior-designer`
- `asset-namer`
- `localizer`
- `build-automator`

## Suggested Core Council For An Unreal Prototype

1. `level-designer`
2. `gameplay-scripter`
3. `behavior-designer`
4. `dialogue-writer`
5. `shader-creator`
6. `game-developer`
7. `test-automator`
8. `performance-engineer`

## Suggested Working Contracts

- `Specs/environment-art/*.md`
- `Specs/level-layouts/*.json`
- `Specs/animation/*.md`
- `Specs/behavior-trees/*.json`
- `Specs/dialogue/*.json`
- `Specs/materials/*.md`
- `Specs/localization/*.csv`
- `Specs/naming/*.md`
- `Specs/build/*.md`
- `Generated/reports/*.md`

Keep generated intermediate specs in `Specs/` and `Generated/` rather than writing directly into Unreal assets unless the importer step is deterministic and reviewable.
