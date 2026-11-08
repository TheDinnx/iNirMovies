#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

version="$(tr -d '[:space:]' < VERSION)"
tag="v$version"
build="$root/build"
linuxBin="$root/dist/iNirMovies"
windowsBin="$root/dist/iNirMovies.exe"

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
install -m 644 LICENSE "$windowsStage/LICENSE"
install -m 644 VERSION "$windowsStage/VERSION"

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
