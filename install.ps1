#!/usr/bin/env pwsh
$ErrorActionPreference = 'Stop'

$chezmoi = Get-Command chezmoi -ErrorAction SilentlyContinue
if (-not $chezmoi) {
    $binDir = Join-Path $HOME ".local/bin"
    if (-not (Test-Path $binDir)) {
        New-Item -ItemType Directory -Force -Path $binDir | Out-Null
    }
    $chezmoi = Join-Path $binDir "chezmoi.exe"
    Write-Host "Installing chezmoi to '$chezmoi'" -ForegroundColor Cyan
    $scriptContent = Invoke-RestMethod -Uri "https://get.chezmoi.io/ps1"
    $installer = [ScriptBlock]::Create($scriptContent)
    & $installer -Destination $binDir | Out-Null
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$arguments = @(
    "init",
    "--apply",
    "--source=$scriptDir",
    "--no-tty",
    "--force"
)

Write-Host "Running 'chezmoi $($arguments -join ' ')'" -ForegroundColor Cyan
& $chezmoi @arguments
