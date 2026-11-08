$ErrorActionPreference = 'Stop'

$target = Join-Path $env:LOCALAPPDATA 'Programs\iNirMovies'
$shortcutPath = Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs\iNir Movies.lnk'
$uninstallKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\iNirMovies'

Get-Process -Name 'iNirMovies' -ErrorAction SilentlyContinue | Stop-Process -Force

if (Test-Path $shortcutPath) {
    Remove-Item -Path $shortcutPath -Force
}

if (Test-Path $uninstallKey) {
    Remove-Item -Path $uninstallKey -Recurse -Force
}

if (Test-Path $target) {
    $cleanup = 'ping 127.0.0.1 -n 3 >nul & rmdir /s /q "' + $target + '"'
    Start-Process -FilePath 'cmd.exe' -ArgumentList '/c', $cleanup -WindowStyle Hidden
}

Write-Host 'Removed.'
