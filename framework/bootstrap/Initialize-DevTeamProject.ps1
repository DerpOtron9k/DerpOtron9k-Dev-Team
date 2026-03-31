param(
    [Parameter(Mandatory = $true)]
    [string]$TargetProjectPath,

    [Parameter(Mandatory = $true)]
    [string]$ProjectName,

    [string[]]$CouncilSeats = @(
        "architect-reviewer",
        "ui-designer",
        "api-designer",
        "qa-expert"
    ),

    [string[]]$DeliverySeats = @(
        "product-manager",
        "scrum-master"
    ),

    [switch]$IncludeScrumCoach
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$CatalogRoot = Join-Path $RepoRoot "Subagent Directory"
$TemplateRoot = Join-Path $RepoRoot "framework\templates\project"
$OverlayRoot = Join-Path $RepoRoot "framework\overlays"

function Ensure-Directory {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

function Find-SeatToml {
    param([string]$SeatName)

    $overlayMatch = Get-ChildItem -Path $OverlayRoot -Recurse -Filter "$SeatName.toml" | Select-Object -First 1
    if ($overlayMatch) {
        return $overlayMatch.FullName
    }

    $catalogMatch = Get-ChildItem -Path $CatalogRoot -Recurse -Filter "$SeatName.toml" | Select-Object -First 1
    if (-not $catalogMatch) {
        throw "Could not find seat TOML for '$SeatName' under '$OverlayRoot' or '$CatalogRoot'."
    }
    return $catalogMatch.FullName
}

function Write-TemplateFile {
    param(
        [string]$SourcePath,
        [string]$DestinationPath,
        [hashtable]$Replacements
    )

    $content = Get-Content -Path $SourcePath -Raw
    foreach ($key in $Replacements.Keys) {
        $content = $content.Replace($key, $Replacements[$key])
    }

    Ensure-Directory -Path (Split-Path -Parent $DestinationPath)
    Set-Content -Path $DestinationPath -Value $content -NoNewline
}

function Initialize-SeatHistory {
    param([string]$SeatName)

    $historyPath = Join-Path $TargetProjectPath ".codex\council\$SeatName.md"
    $content = @"
# $SeatName history

Last updated: $(Get-Date -Format "yyyy-MM-dd")

## Standing position

- Document this seat's standing opinions, concerns, and default operating stance.
"@
    Set-Content -Path $historyPath -Value $content -NoNewline
}

function Format-SeatList {
    param([string[]]$Seats)

    if (-not $Seats -or $Seats.Count -eq 0) {
        return "- None selected yet."
    }

    $lines = for ($index = 0; $index -lt $Seats.Count; $index++) {
        ('{0}. `{1}`' -f ($index + 1), $Seats[$index])
    }

    return ($lines -join "`r`n")
}

Ensure-Directory -Path $TargetProjectPath
Ensure-Directory -Path (Join-Path $TargetProjectPath ".codex\agents")
Ensure-Directory -Path (Join-Path $TargetProjectPath ".codex\council")
Ensure-Directory -Path (Join-Path $TargetProjectPath "docs")
Ensure-Directory -Path (Join-Path $TargetProjectPath ".taskmaster\docs")

$projectPathForDocs = $TargetProjectPath.Replace("\", "/")
$deliverySeatList = @($DeliverySeats)
if ($IncludeScrumCoach) {
    $deliverySeatList += "scrum-coach"
}
$deliverySeatList = $deliverySeatList | Select-Object -Unique

$replacements = @{
    "__PROJECT_NAME__" = $ProjectName
    "__PROJECT_PATH__" = $projectPathForDocs
    "__DATE__" = (Get-Date -Format "yyyy-MM-dd")
    "__COUNCIL_SEATS__" = (Format-SeatList -Seats $CouncilSeats)
    "__DELIVERY_SEATS__" = (Format-SeatList -Seats $deliverySeatList)
}

$templateFiles = @(
    "AGENTS.md",
    "docs\COUNCIL.md",
    "docs\DELIVERY_MODEL.md",
    "docs\CEREMONIES.md",
    "docs\EPICS.md",
    "docs\MCP_STACK.md",
    "docs\SPRINT.md",
    "docs\SUBAGENT_SOURCING.md",
    ".codex\config.toml.example",
    ".codex\council\shared-state.md",
    ".taskmaster\docs\prd.txt"
)

foreach ($file in $templateFiles) {
    Write-TemplateFile `
        -SourcePath (Join-Path $TemplateRoot $file) `
        -DestinationPath (Join-Path $TargetProjectPath $file) `
        -Replacements $replacements
}

$allSeats = @($CouncilSeats + $deliverySeatList)
$allSeats = $allSeats | Select-Object -Unique

foreach ($seat in $allSeats) {
    $sourceToml = Find-SeatToml -SeatName $seat
    Copy-Item -Path $sourceToml -Destination (Join-Path $TargetProjectPath ".codex\agents\$seat.toml") -Force

    Initialize-SeatHistory -SeatName $seat
}

Write-Host "Initialized AI dev-team framework in '$TargetProjectPath'."
Write-Host "Installed seats: $($allSeats -join ', ')"
Write-Host "Next steps:"
Write-Host "1. Review docs\COUNCIL.md and docs\SPRINT.md"
Write-Host "2. Customize .taskmaster\docs\prd.txt"
Write-Host "3. Initialize Task Master in the target repo if needed"
