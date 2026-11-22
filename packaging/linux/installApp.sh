#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
bin="$HOME/.local/bin"
apps="$HOME/.local/share/applications"
icons="$HOME/.local/share/icons/hicolor/scalable/apps"

mkdir -p "$bin" "$apps" "$icons"

tmp="$bin/.iNirMovies.new.$$"
cp -f "$here/iNirMovies" "$tmp"
chmod 755 "$tmp"
mv -f "$tmp" "$bin/iNirMovies"

if [ -f "$here/iNirMovies.svg" ]; then
    cp -f "$here/iNirMovies.svg" "$icons/io.inirmovies.app.svg"
fi

desktop="$apps/io.inirmovies.app.desktop"
if [ -f "$here/io.inirmovies.app.desktop" ]; then
    sed -e "s|^Exec=.*|Exec=$bin/iNirMovies|" -e "s|^TryExec=.*|TryExec=$bin/iNirMovies|" "$here/io.inirmovies.app.desktop" > "$desktop"
else
    cat > "$desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=iNir Movies
Comment=Cinemana movies, TV shows and live channels
Exec=$bin/iNirMovies
Icon=io.inirmovies.app
Terminal=false
Categories=AudioVideo;Video;Player;
DESKTOP
fi

if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$apps" >/dev/null 2>&1 || true
fi
if command -v gtk-update-icon-cache >/dev/null 2>&1; then
    gtk-update-icon-cache -f -t "$HOME/.local/share/icons/hicolor" >/dev/null 2>&1 || true
fi

if command -v pacman >/dev/null 2>&1 && pacman -Qi inir-movies >/dev/null 2>&1; then
    if sudo -n true >/dev/null 2>&1; then
        sudo -n pacman -R --noconfirm inir-movies >/dev/null 2>&1 || true
    elif [ -t 0 ] && [ -t 1 ]; then
        sudo pacman -R --noconfirm inir-movies || true
    elif command -v pkexec >/dev/null 2>&1 && { [ -n "${DISPLAY:-}" ] || [ -n "${WAYLAND_DISPLAY:-}" ]; }; then
        pkexec pacman -R --noconfirm inir-movies >/dev/null 2>&1 || true
    fi
fi

echo "Installed. Launch iNir Movies from your applications menu or run: iNirMovies"
