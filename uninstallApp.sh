#!/usr/bin/env bash
set -euo pipefail

rm -f "$HOME/.local/bin/iNirMovies" \
      "$HOME/.local/share/applications/io.inirmovies.app.desktop" \
      "$HOME/.local/share/icons/hicolor/scalable/apps/io.inirmovies.app.svg"

update-desktop-database "$HOME/.local/share/applications" >/dev/null 2>&1 || true
echo "Removed."
