#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
version="$(tr -d '[:space:]' < "$root/VERSION")"
pkgver="${version//-/.}"
tag="v$version"
repo="${PACMAN_REPO:-TheDinnx/iNirMovies}"
work="$root/build/pacman"
tarball="$root/build/iNirMovies-linux.tar.gz"

for tool in makepkg repo-add gh sha256sum; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "Skipping the pacman package: $tool is not installed."
        exit 0
    fi
done

if [ ! -f "$tarball" ]; then
    echo "Missing $tarball. Run scripts/makeRelease.sh first." >&2
    exit 1
fi

sum="$(sha256sum "$tarball" | cut -d' ' -f1)"

rm -rf "$work"
mkdir -p "$work"
cd "$work"

cat > PKGBUILD <<'PKG'
pkgname=inir-movies
pkgver=@PKGVER@
pkgrel=1
pkgdesc="Watch Cinemana movies, TV shows and live channels in one fast, simple app (Earthlink only)"
arch=("x86_64")
url="https://github.com/@REPO@"
license=("custom")
depends=("mpv" "xcb-util-cursor" "curl" "iproute2")
options=("!strip" "!debug")
source=("$pkgname-$pkgver.tar.gz::https://github.com/@REPO@/releases/download/@TAG@/iNirMovies-linux.tar.gz")
sha256sums=("@SUM@")

package() {
    cd "$srcdir/iNirMovies"
    install -Dm755 iNirMovies "$pkgdir/usr/bin/iNirMovies"
    install -Dm644 io.inirmovies.app.desktop "$pkgdir/usr/share/applications/io.inirmovies.app.desktop"
    install -Dm644 iNirMovies.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.inirmovies.app.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
PKG

sed -i "s#@PKGVER@#$pkgver#; s#@REPO@#$repo#g; s#@TAG@#$tag#; s#@SUM@#$sum#" PKGBUILD

makepkg -f --noconfirm
pkg="$(find . -maxdepth 1 -name '*.pkg.tar.zst' | head -1)"
repo-add iNirMovies.db.tar.gz "$pkg"
cp -L iNirMovies.db.tar.gz iNirMovies.db
cp -L iNirMovies.files.tar.gz iNirMovies.files

gh release upload "$tag" "$pkg" iNirMovies.db iNirMovies.files -R "$repo" --clobber
echo "Pacman package $pkgver-1 published."
