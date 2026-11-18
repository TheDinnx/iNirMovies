#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

version="$(tr -d '[:space:]' < VERSION)"
tag="v$version"
build="$root/build"
linuxBin="$root/dist/iNirMovies"
windowsBin="$root/dist/iNirMovies.exe"
windowsTools="$root/dist/tools"

for tool in gh zip tar sha256sum; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "Missing required tool: $tool" >&2
        exit 1
    fi
done

for bin in "$linuxBin" "$windowsBin"; do
    if [ ! -f "$bin" ]; then
        echo "Missing ${bin#"$root"/}. Put the compiled Linux and Windows binaries in dist/ first." >&2
        exit 1
    fi
done

if [ ! -f "$windowsTools/git/usr/bin/bash.exe" ] || [ ! -f "$windowsTools/mpv/mpv.exe" ]; then
    echo "Missing dist/tools (bundled bash and mpv for Windows). Run ./release.sh in the iNirMovies-build folder first." >&2
    exit 1
fi

rm -rf "$build"
mkdir -p "$build/stage/linux/iNirMovies" "$build/stage/windows/iNirMovies"

linuxStage="$build/stage/linux/iNirMovies"
install -m 755 "$linuxBin" "$linuxStage/iNirMovies"
install -m 644 assets/icons/appIcon.svg "$linuxStage/iNirMovies.svg"
install -m 644 packaging/linux/io.inirmovies.app.desktop "$linuxStage/io.inirmovies.app.desktop"
install -m 755 packaging/linux/installApp.sh "$linuxStage/installApp.sh"
install -m 755 packaging/linux/uninstallApp.sh "$linuxStage/uninstallApp.sh"
install -m 644 LICENSE "$linuxStage/LICENSE"
install -m 644 VERSION "$linuxStage/VERSION"

windowsStage="$build/stage/windows/iNirMovies"
install -m 755 "$windowsBin" "$windowsStage/iNirMovies.exe"
install -m 644 packaging/windows/installApp.ps1 "$windowsStage/installApp.ps1"
install -m 644 packaging/windows/uninstallApp.ps1 "$windowsStage/uninstallApp.ps1"
install -m 644 packaging/windows/Install.bat "$windowsStage/Install.bat"
install -m 644 packaging/windows/Uninstall.bat "$windowsStage/Uninstall.bat"
install -m 644 packaging/windows/FixMpv.bat "$windowsStage/FixMpv.bat"
cp -r "$windowsTools" "$windowsStage/tools"
install -m 644 LICENSE "$windowsStage/LICENSE"
install -m 644 VERSION "$windowsStage/VERSION"

for f in iNirMovies.exe installApp.ps1 uninstallApp.ps1 Install.bat Uninstall.bat FixMpv.bat tools/mpv/mpv.exe tools/bin/mpv tools/git/usr/bin/bash.exe LICENSE VERSION; do
    if [ ! -e "$windowsStage/$f" ]; then
        echo "Windows package is missing $f, nothing was published." >&2
        exit 1
    fi
done

tar --owner=0 --group=0 -C "$build/stage/linux" -czf "$build/iNirMovies-linux.tar.gz" iNirMovies
(cd "$build/stage/windows" && zip -qr "$build/iNirMovies-windows.zip" iNirMovies)
(cd "$build" && sha256sum iNirMovies-linux.tar.gz iNirMovies-windows.zip > SHA256SUMS)

awk -v header="## $version" '$0 == header { found = 1; next } /^## / { found = 0 } found' docs/CHANGELOG.md > "$build/notes.md"
if [ ! -s "$build/notes.md" ]; then
    echo "iNir Movies $version" > "$build/notes.md"
fi

assets=("$build/iNirMovies-linux.tar.gz" "$build/iNirMovies-windows.zip" "$build/SHA256SUMS")

if gh release view "$tag" >/dev/null 2>&1; then
    gh release upload "$tag" "${assets[@]}" --clobber
    gh release edit "$tag" --title "iNir Movies $version" --notes-file "$build/notes.md"
else
    gh release create "$tag" "${assets[@]}" --title "iNir Movies $version" --notes-file "$build/notes.md" --latest
fi

echo "Release $tag published."

if [ -x "$root/scripts/makePacman.sh" ]; then
    "$root/scripts/makePacman.sh" || echo "The pacman package step failed." >&2
fi
