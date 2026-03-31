# Android App Overlay Seats

Reference example only.

This overlay set is not active project direction by itself. It becomes relevant only if the Product Owner explicitly chooses an Android application direction.

These overlay seats extend the starter framework for native Android application delivery.

Use them together with the upstream catalog in [Subagent Directory](/R:/GitRepo/DerpOtron9k-Dev-Team/Subagent%20Directory), not instead of it.

## Reuse From Upstream

- `product-manager`
- `scrum-master`
- `scrum-coach`
- `mobile-developer`
- `mobile-app-developer`
- `kotlin-specialist`
- `ui-designer`
- `api-designer`
- `qa-expert`
- `test-automator`
- `performance-engineer`
- `tooling-engineer`

## Add From This Overlay Set

- `android-platform-engineer`
- `jetpack-compose-specialist`
- `android-build-release-engineer`
- `android-sdk-integrator`

## Suggested Core Council For An Android Product

1. `android-platform-engineer`
2. `jetpack-compose-specialist`
3. `mobile-app-developer`
4. `kotlin-specialist`
5. `android-build-release-engineer`
6. `qa-expert`
7. `test-automator`
8. `performance-engineer`

Add `android-sdk-integrator`, `ui-designer`, `api-designer`, and `tooling-engineer` once the product starts depending on vendor SDKs, custom design-system work, backend contract churn, or heavier build tooling.

## Suggested Working Contracts

- `Specs/app-flows/*.md`
- `Specs/compose/*.md`
- `Specs/device-matrix/*.md`
- `Specs/release/*.md`
- `Specs/sdk-integrations/*.md`
- `Generated/benchmarks/*.json`
- `Generated/reports/*.md`
- `Generated/screenshots/*.png`

Keep accepted contracts in `Specs/` and generated validation artifacts in `Generated/`. Avoid burying product or release decisions directly in Gradle files, manifests, or vendor setup until the team has reviewed them.
