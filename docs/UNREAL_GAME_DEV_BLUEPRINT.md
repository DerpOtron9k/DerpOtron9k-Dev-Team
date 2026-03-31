# Unreal Game-Dev Extraction

Reference example only.

This document is not active project direction unless the Product Owner explicitly selects Unreal game development as the project direction.

This document extracts the report into a concrete seat set and a project folder structure that can actually be bootstrapped.

## Seat Selection

### Delivery Ring

Keep the existing delivery ring:

1. `product-manager`
2. `scrum-master`
3. `scrum-coach`

### Reuse Existing Upstream Seats

Use these directly from [Subagent Directory](/R:/GitRepo/DerpOtron9k-Dev-Team/Subagent%20Directory):

- `game-developer`
- `ui-designer`
- `qa-expert`
- `test-automator`
- `performance-engineer`
- `tooling-engineer`

### Add Game-Specific Overlay Seats

Use these from [framework/overlays/game-dev](/R:/GitRepo/DerpOtron9k-Dev-Team/framework/overlays/game-dev):

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

## Recommended Working Council

For a first Unreal prototype, start with:

1. `level-designer`
2. `gameplay-scripter`
3. `behavior-designer`
4. `dialogue-writer`
5. `shader-creator`
6. `game-developer`
7. `test-automator`
8. `performance-engineer`

Add `environment-artist`, `animation-retargeter`, `asset-namer`, `localizer`, and `build-automator` when their pipeline slice becomes active.

## Recommended Project Tree

```text
<project-root>/
  .codex/
    agents/
    council/
    config.toml.example
  .taskmaster/
    docs/
      prd.txt
  docs/
    COUNCIL.md
    DELIVERY_MODEL.md
    CEREMONIES.md
    EPICS.md
    MCP_STACK.md
    SPRINT.md
    SUBAGENT_SOURCING.md
    GAME_PIPELINE.md
    DATA_CONTRACTS.md
  Specs/
    environment-art/
    level-layouts/
    animation/
    behavior-trees/
    dialogue/
    materials/
    localization/
    naming/
    build/
  Generated/
    environment-art/
    level-layouts/
    animation/
    behavior-trees/
    dialogue/
    materials/
    reports/
  Tools/
    CodexBridge/
      schemas/
      routes/
      jobs/
      prompts/
  Unreal/
    <ProjectName>.uproject
    Config/
    Content/
    Plugins/
      CodexBridge/
        Content/
          EditorUtilities/
        Scripts/
        Source/
          CodexBridge/
  Tests/
    Automation/
    Integration/
```

## Why This Tree

- `.codex/` keeps seats and continuity isolated from game assets.
- `.taskmaster/` remains the delivery-layer system for PRD, PBIs, and subtasks.
- `docs/` holds durable workflow, council, and pipeline rules.
- `Specs/` stores human-reviewed intermediate contracts that subagents can read and write safely.
- `Generated/` stores machine-produced artifacts and reports that can be regenerated.
- `Tools/CodexBridge/` is the external orchestrator surface for REST, WebSocket, queue, and schema logic.
- `Unreal/Plugins/CodexBridge/` is the in-editor integration surface for Python, Blueprint utilities, and any C++ bridge code.

## Contract Boundaries

- `environment-artist` owns `Specs/environment-art/` and emits art briefs, kit breakdowns, sourcing notes, and rendering constraints.
- `level-designer` owns `Specs/level-layouts/` and emits JSON or Markdown layout specs.
- `animation-retargeter` owns `Specs/animation/` and emits retarget plans, chain mappings, output asset rules, and cleanup notes.
- `behavior-designer` owns `Specs/behavior-trees/` and emits Blackboard and Behavior Tree structures.
- `dialogue-writer` owns `Specs/dialogue/` and emits structured dialogue blocks with stable line IDs, state tags, and VO direction notes.
- `localizer` reads from `Specs/dialogue/` and writes localization exports under `Specs/localization/`.
- `shader-creator` owns `Specs/materials/` and emits material or HLSL specs before Unreal asset creation.
- `asset-namer` owns `Specs/naming/` and emits naming policy, folder taxonomy, rename maps, and redirector cleanup plans.
- `build-automator` owns `Specs/build/` plus CI definitions in the repo root.
- `gameplay-scripter` owns direct implementation changes plus any supporting gameplay notes required to land a feature safely.
- `Generated/reports/` is the shared sink for QA, performance, and validation reports.

Do not write directly into `Unreal/Content/` from an LLM unless the importer step is deterministic, reviewable, and reversible.

## Suggested Bootstrap Command

With the updated bootstrap script, overlay seats can now be installed by name:

```powershell
.\framework\bootstrap\Initialize-DevTeamProject.ps1 `
  -TargetProjectPath "R:\GitRepo\MyGame" `
  -ProjectName "My Game" `
  -CouncilSeats @(
    "level-designer",
    "environment-artist",
    "gameplay-scripter",
    "shader-creator",
    "animation-retargeter",
    "dialogue-writer",
    "behavior-designer",
    "asset-namer",
    "localizer",
    "build-automator",
    "game-developer",
    "test-automator",
    "performance-engineer"
  ) `
  -DeliverySeats @(
    "product-manager",
    "scrum-master"
  ) `
  -IncludeScrumCoach
```

## Minimum Viable Build Order

1. Install the delivery ring plus `level-designer`, `gameplay-scripter`, and `behavior-designer`.
2. Stand up `Tools/CodexBridge/` and prove one request path from Codex to Unreal.
3. Ingest one `Specs/level-layouts/*.json` file into the editor through Python or an editor utility.
4. Add `dialogue-writer` and `shader-creator` after the core import loop is working.
5. Add QA, performance, localization, and build automation once the vertical slice exists.
