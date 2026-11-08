#!/usr/bin/env bash
set -euo pipefail

srcDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
binDir="$HOME/.local/bin"
appsDir="$HOME/.local/share/applications"
iconsDir="$HOME/.local/share/icons/hicolor/scalable/apps"

for file in iNirMovies iNirMovies.svg io.inirmovies.app.desktop; do
    if [ ! -f "$srcDir/$file" ]; then
        echo "Missing $file next to the installer" >&2
        exit 1
    fi
done

mkdir -p "$binDir" "$appsDir" "$iconsDir"
install -m 755 "$srcDir/iNirMovies" "$binDir/iNirMovies"
install -m 644 "$srcDir/iNirMovies.svg" "$iconsDir/io.inirmovies.app.svg"
install -m 644 "$srcDir/io.inirmovies.app.desktop" "$appsDir/io.inirmovies.app.desktop"
sed -i "s#^Exec=.*#Exec=$binDir/iNirMovies#" "$appsDir/io.inirmovies.app.desktop"

update-desktop-database "$appsDir" >/dev/null 2>&1 || true
gtk-update-icon-cache -f "$HOME/.local/share/icons/hicolor" >/dev/null 2>&1 || true

if ! command -v mpv >/dev/null 2>&1; then
    echo "Warning: mpv is not installed. Install it before launching the app." >&2
fi

case ":$PATH:" in
    *":$binDir:"*) ;;
    *) echo "Note: $binDir is not in your PATH. Launch from the applications menu instead." ;;
esac

echo "Installed. Launch iNir Movies from your applications menu or run: iNirMovies"
