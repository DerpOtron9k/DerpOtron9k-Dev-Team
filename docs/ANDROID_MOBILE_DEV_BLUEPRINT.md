# Android Mobile App Blueprint

Reference example only.

This document is not active project direction unless the Product Owner explicitly selects Android application development as the project direction.

This document turns Android mobile delivery into a concrete council shape and bootstrap path for this starter framework.

## Seat Selection

### Delivery Ring

Keep the existing delivery ring:

1. `product-manager`
2. `scrum-master`
3. `scrum-coach`

### Reuse Existing Upstream Seats

Use these directly from [Subagent Directory](/R:/GitRepo/DerpOtron9k-Dev-Team/Subagent%20Directory):

- `mobile-developer`
- `mobile-app-developer`
- `kotlin-specialist`
- `ui-designer`
- `api-designer`
- `qa-expert`
- `test-automator`
- `performance-engineer`
- `tooling-engineer`

### Add Android-Specific Overlay Seats

Use these from [framework/overlays/android-dev](/R:/GitRepo/DerpOtron9k-Dev-Team/framework/overlays/android-dev):

- `android-platform-engineer`
- `jetpack-compose-specialist`
- `android-build-release-engineer`
- `android-sdk-integrator`

## Recommended Working Council

For a first Android product or serious prototype, start with:

1. `android-platform-engineer`
2. `jetpack-compose-specialist`
3. `mobile-app-developer`
4. `kotlin-specialist`
5. `android-build-release-engineer`
6. `qa-expert`
7. `test-automator`
8. `performance-engineer`

Add `android-sdk-integrator` when the product starts depending on vendor SDKs such as auth, billing, maps, analytics, notifications, camera, or wallet flows.

Add `ui-designer`, `api-designer`, and `tooling-engineer` when the app has active design-system work, backend contract churn, or repo-level build-tooling work that needs dedicated ownership.

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
    ANDROID_ARCHITECTURE.md
    API_CONTRACTS.md
    MOBILE_RELEASES.md
  Specs/
    app-flows/
    compose/
    device-matrix/
    release/
    sdk-integrations/
  Generated/
    benchmarks/
    reports/
    screenshots/
  android/
    app/
    core/
    feature/
    benchmark/
    build-logic/
```

If the repo is Android-only, it is also reasonable to flatten `android/` and keep `app/`, `core/`, `feature/`, `benchmark/`, and `build-logic/` at the repo root.

## Why This Tree

- `.codex/` keeps seats and continuity separate from product code.
- `.taskmaster/` stays the delivery-layer system for PRD, PBIs, and subtasks.
- `docs/` holds durable architecture, release, and workflow rules.
- `Specs/` stores reviewable contracts for flows, release plans, device support, and SDK integrations.
- `Generated/` stores screenshots, benchmark outputs, and QA reports that can be regenerated.
- `android/` keeps the app modules and build logic isolated from repo-level governance when the repo also contains backend, web, or tooling surfaces.

## Contract Boundaries

- `android-platform-engineer` owns direct Android implementation changes plus lifecycle, manifest, permission, and device-behavior notes.
- `jetpack-compose-specialist` owns `Specs/compose/` and emits screen structure, state-owner boundaries, navigation notes, and accessibility considerations when a task needs a reviewable contract.
- `android-build-release-engineer` owns `Specs/release/` plus build and CI definitions in the repo.
- `android-sdk-integrator` owns `Specs/sdk-integrations/` and emits setup notes, wrapper boundaries, callback contracts, and privacy-sensitive assumptions.
- `mobile-app-developer` owns end-to-end product flow coherence across screens, API handling, and release-sensitive behavior.
- `kotlin-specialist` owns language-level contract quality, concurrency behavior, and null-safety in changed implementation paths.
- `qa-expert`, `test-automator`, and `performance-engineer` write reports under `Generated/reports/` and `Generated/benchmarks/`.

Do not bury delivery decisions only in Gradle files, manifests, or vendor setup guides when they should also live as reviewable contracts under `Specs/` or `docs/`.

## Suggested Bootstrap Command

With the updated bootstrap script, overlay seats can be installed by name:

```powershell
.\framework\bootstrap\Initialize-DevTeamProject.ps1 `
  -TargetProjectPath "R:\GitRepo\MyAndroidApp" `
  -ProjectName "My Android App" `
  -CouncilSeats @(
    "android-platform-engineer",
    "jetpack-compose-specialist",
    "android-build-release-engineer",
    "android-sdk-integrator",
    "mobile-app-developer",
    "kotlin-specialist",
    "qa-expert",
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

1. Install the delivery ring plus `android-platform-engineer`, `jetpack-compose-specialist`, and `mobile-app-developer`.
2. Prove one screen-to-data flow with clean loading, error, and offline behavior.
3. Add `android-build-release-engineer` once the app needs reliable CI, flavors, signing, or staged rollout planning.
4. Add `qa-expert`, `test-automator`, and `performance-engineer` once the first vertical slice is stable enough to benchmark and automate.
5. Add `android-sdk-integrator` when vendor SDKs, billing, maps, push, or auth flows enter the roadmap.
