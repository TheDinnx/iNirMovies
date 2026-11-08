$ErrorActionPreference = 'Stop'

$srcDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$exeName = 'iNirMovies.exe'
$srcExe = Join-Path $srcDir $exeName
$target = Join-Path $env:LOCALAPPDATA 'Programs\iNirMovies'
$shortcutPath = Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs\iNir Movies.lnk'
$uninstallKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\iNirMovies'
$versionFile = Join-Path $srcDir 'VERSION'

if (-not (Test-Path $srcExe)) {
    throw "$exeName was not found next to the installer"
}

$version = '0'
if (Test-Path $versionFile) {
    $version = (Get-Content $versionFile -Raw).Trim()
}

if (-not (Get-Command mpv.exe -ErrorAction SilentlyContinue)) {
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        Write-Host 'mpv was not found, installing it with winget...'
        try {
            winget install --id shinchiro.mpv -e --accept-source-agreements --accept-package-agreements
        } catch {
            Write-Warning 'Automatic mpv install failed. Install mpv from https://mpv.io and add it to PATH.'
        }
    } else {
        Write-Warning 'mpv was not found. Install mpv from https://mpv.io and add it to PATH.'
    }
}

Get-Process -Name 'iNirMovies' -ErrorAction SilentlyContinue | Stop-Process -Force

New-Item -ItemType Directory -Force -Path $target | Out-Null
Copy-Item -Path $srcExe -Destination (Join-Path $target $exeName) -Force
foreach ($name in 'uninstallApp.ps1', 'Uninstall.bat', 'LICENSE', 'VERSION') {
    $item = Join-Path $srcDir $name
    if (Test-Path $item) {
        Copy-Item -Path $item -Destination (Join-Path $target $name) -Force
    }
}

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = Join-Path $target $exeName
$shortcut.WorkingDirectory = $target
$shortcut.IconLocation = (Join-Path $target $exeName) + ',0'
$shortcut.Description = 'iNir Movies'
$shortcut.Save()

New-Item -Path $uninstallKey -Force | Out-Null
$uninstallCommand = 'powershell.exe -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $target 'uninstallApp.ps1') + '"'
Set-ItemProperty -Path $uninstallKey -Name 'DisplayName' -Value 'iNir Movies'
Set-ItemProperty -Path $uninstallKey -Name 'DisplayVersion' -Value $version
Set-ItemProperty -Path $uninstallKey -Name 'Publisher' -Value 'TheDinnx'
Set-ItemProperty -Path $uninstallKey -Name 'InstallLocation' -Value $target
Set-ItemProperty -Path $uninstallKey -Name 'DisplayIcon' -Value (Join-Path $target $exeName)
Set-ItemProperty -Path $uninstallKey -Name 'UninstallString' -Value $uninstallCommand
Set-ItemProperty -Path $uninstallKey -Name 'NoModify' -Value 1 -Type DWord
Set-ItemProperty -Path $uninstallKey -Name 'NoRepair' -Value 1 -Type DWord

Write-Host "Installed iNir Movies $version. Launch it from the Start Menu."
