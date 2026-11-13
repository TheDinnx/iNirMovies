@echo off
setlocal enabledelayedexpansion

set "appDir=%~dp0"
set "found="

if exist "%appDir%tools\mpv\mpv.exe" (
    set "found=%appDir%tools\mpv\mpv.exe"
) else (
    for /f "delims=" %%F in ('dir /s /b "%appDir%tools\mpv.exe" 2^>nul') do (
        if not defined found set "found=%%F"
    )
)

if not defined found (
    echo Could not find mpv.exe under %appDir%tools
    echo Re-download the iNir Movies zip and extract the whole thing, do not
    echo copy iNirMovies.exe out of its folder on its own.
    pause
    exit /b 1
)

echo Found mpv.exe at: %found%
for %%I in ("%found%") do set "mpvDir=%%~dpI"
set "mpvDir=%mpvDir:~0,-1%"

if /i not "%mpvDir%"=="%appDir%tools\mpv" (
    echo mpv.exe is nested one folder deeper than expected.
    echo Moving its contents up to %appDir%tools\mpv
    robocopy "%mpvDir%" "%appDir%tools\mpv" /e /move >nul
)

echo Testing mpv...
"%appDir%tools\mpv\mpv.exe" --version
if errorlevel 1 (
    echo mpv did not run. It may be blocked by antivirus or missing a file.
    pause
    exit /b 1
)

echo.
echo mpv is working. You can close this window and open iNir Movies again.
pause
