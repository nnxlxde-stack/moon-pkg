$ErrorActionPreference = "Stop"
$Root = Split-Path $PSScriptRoot -Parent
$MoonLang = Join-Path (Split-Path $Root -Parent) "moon-lang"
if (-not (Test-Path (Join-Path $MoonLang "Package.swift"))) {
    $MoonLang = $env:MOON_LANG_ROOT
}
if (-not $MoonLang -or -not (Test-Path (Join-Path $MoonLang "Package.swift"))) {
    Write-Error "Set MOON_LANG_ROOT or clone moon-lang as sibling of moon-pkg"
}

$MoonExe = Join-Path $MoonLang ".build\debug\moon.exe"
if (-not (Test-Path $MoonExe)) {
    Push-Location $MoonLang
    swift build
    Pop-Location
}

$PackagesDir = Join-Path $Root "packages"
$failed = 0
Get-ChildItem $PackagesDir -Directory | ForEach-Object {
    $pkgDir = $_.FullName
    $manifestPath = Join-Path $pkgDir "moon.pkg.json"
    if (-not (Test-Path $manifestPath)) {
        Write-Host "[skip] $($_.Name): no moon.pkg.json"
        return
    }
    $manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json
    Write-Host "[verify] $($manifest.name) v$($manifest.version)"
    foreach ($export in $manifest.exports) {
        $file = Join-Path $pkgDir ($export -replace '/', [IO.Path]::DirectorySeparatorChar)
        if (-not (Test-Path $file)) {
            Write-Host "  missing export: $export"
            $failed++
            continue
        }
        & $MoonExe check $file
        if ($LASTEXITCODE -ne 0) { $failed++ }
    }
}

if ($failed -gt 0) { exit 1 }
Write-Host "All packages verified."