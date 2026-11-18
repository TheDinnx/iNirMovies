<div align="center">

<img src="assets/icons/appIcon.svg" alt="iNir Movies" width="120">

# iNir Movies

**Watch Cinemana movies, TV shows and live channels in one fast, simple app**

[![Latest release](assets/badges/release.svg)](https://github.com/TheDinnx/iNirMovies/releases/latest)
[![Download](assets/badges/download.svg)](https://github.com/TheDinnx/iNirMovies/releases/latest)
[![Platform](assets/badges/platform.svg)](#requirements)
[![Network](assets/badges/network.svg)](#important-which-source-works-on-your-internet)
[![License](assets/badges/license.svg)](LICENSE)

</div>

---

<a id="important-earthlink-only"></a>

## Important: Which source works on your internet

iNir Movies is a desktop client for **Cinemana**, the streaming library available in Iraq. The library can be reached from two addresses, and which one answers depends on your internet connection:

| Source in the app | Works on |
| ----------------- | -------- |
| **Cinemana** | **Earthlink only** |
| **Cinemana X** | **Any Iraqi IP address**, Earthlink or any other Iraqi provider |
| **Cinemeta** | Any internet connection, anywhere |

Cinemana and Cinemana X are the same library with the same categories, languages and qualities. Pick the source from the menu next to the search box. If one does not load on your connection, switch to another. Outside Iraq, or on an IP that is not Iraqi, Cinemana and Cinemana X will not load. This is a limit of the service itself and not a bug in the app, so please do not report it as one.

## Features

- Browse Cinemana movies, TV shows and live channels from one screen
- Live channels from any channels file: M3U, M3U8, JSON, PLS, XSPF or a plain list, with categories, logos and merged servers
- Live channels from any channels file: M3U, M3U8, JSON, PLS, XSPF or a plain list, with categories, logos and merged servers
- Live channels from any channels file: M3U, M3U8, JSON, PLS, XSPF or a plain list, with categories, logos and merged servers
- Live channels from any channels file: M3U, M3U8, JSON, PLS, XSPF or a plain list, with categories, logos and merged servers
- Live channels from any channels file: M3U, M3U8, JSON, PLS, XSPF or a plain list, with categories, logos and merged servers
- Built-in guide that walks first-time users through the app
- Smart, Default or custom window sizing, remembered between launches
- Skip-intro button during playback, with a shortcut to dismiss it
- Adjustable card density, light/dark aware interface
- Bilingual interface: English and Arabic
- One release for both Windows and Linux

## Install

Every release contains two files:

| File | Platform |
|---|---|
| `iNirMovies-linux.tar.gz` | Linux x86_64 |
| `iNirMovies-windows.zip` | Windows 10 / 11 x86_64 |

### Linux

Install the requirements for your distribution:

```sh
sudo pacman -S mpv xcb-util-cursor curl iproute2
sudo apt install mpv libxcb-cursor0 curl iproute2
sudo dnf install mpv xcb-util-cursor curl iproute
```

Download, extract and install:

```sh
curl -LO https://github.com/TheDinnx/iNirMovies/releases/latest/download/iNirMovies-linux.tar.gz
tar xzf iNirMovies-linux.tar.gz
cd iNirMovies
./installApp.sh
```

Launch **iNir Movies** from your applications menu, or run `iNirMovies`.

### Arch Linux (pacman / yay)

Add the repository to `/etc/pacman.conf`:

```
[iNirMovies]
SigLevel = Optional TrustAll
Server = https://github.com/TheDinnx/iNirMovies/releases/latest/download
```

Then install:

```sh
yay -Syu inir-movies
```

### Windows

1. Download `iNirMovies-windows.zip` from
   [Releases](../../releases/latest) and extract it anywhere.
2. Double-click `Install.bat`. It installs the app for your user and
   adds a Start Menu shortcut. Everything the app needs, a shell and
   mpv, is included in the `tools` folder, so there is nothing else to
   install.
3. Launch **iNir Movies** from the Start Menu.

No installer is required to just try it: `iNirMovies.exe` also runs
directly from the extracted folder, as long as the `tools` folder stays
next to it.

## Updating

Download the newest release and run the installer again. It
overwrites the previous version in place.

## Uninstalling

Linux:

```sh
./uninstallApp.sh
```

Windows: open **Settings > Apps > Installed apps**, select
**iNir Movies** and uninstall it, or double-click `Uninstall.bat`.

## Requirements

| Requirement | Why |
|---|---|
| Iraqi internet connection | Cinemana needs Earthlink, Cinemana X works on any Iraqi IP, Cinemeta works anywhere |
| Linux or Windows, x86_64 | the release binaries target these platforms |
| [mpv](https://mpv.io) (Linux only) | plays movies, shows and channels, bundled on Windows |
| xcb-util-cursor (Linux only) | required by the Qt/XCB platform plugin |
| curl and iproute2 (Linux only) | network helpers used by the app |

## Repository structure

```
iNirMovies/
├── assets/
│   ├── icons/            application icon
│   └── screenshots/      images used in this README
├── dist/                 compiled binaries used to build a release (not committed)
├── docs/
│   ├── CHANGELOG.md
│   └── FAQ.md
├── packaging/
│   ├── linux/            desktop entry, install and uninstall scripts
│   └── windows/          PowerShell installer, uninstaller and launchers
├── scripts/
│   └── makeRelease.sh    builds both archives and publishes the release
├── publish.sh            pushes the repository and publishes the release
├── VERSION
└── .github/              issue templates, PR template, lint workflow
```

## About this repository

This repository hosts packaging files only: the install scripts, the
desktop entry, the icon and the docs. The application itself is a
closed, compiled binary attached to each [Release](../../releases);
its interface and resources are compiled into the executable, and the
source is not published. See [SECURITY.md](SECURITY.md) for why, and
[CONTRIBUTING.md](CONTRIBUTING.md) for what kind of contributions are
welcome here.

## Documentation

- [FAQ](docs/FAQ.md)
- [Changelog](docs/CHANGELOG.md)
- [Security](SECURITY.md)
- [Contributing](CONTRIBUTING.md)

## License

See [LICENSE](LICENSE).

**Stuck on an old version and the in-app update does nothing?**
Linux (pacman/yay): `sudo pacman -Syu inir-movies`. If that package is
not found, re-add the repo from the FAQ below, then update again.
Windows: download the latest zip from
[Releases](https://github.com/TheDinnx/iNirMovies/releases/latest),
extract the whole thing over your old install folder, and run
`Install.bat` again. If the player does not start afterwards, run
`FixMpv.bat` from that same folder: it finds and repairs the bundled
mpv on its own, no typing required.

**Stuck on an old version and the in-app update does nothing?**
Releases before 8.0.1 shipped a binary that did not match its own
version number, so updating just reinstalled the same broken version
under a new name. This is fixed from 8.0.1 onward: Linux (pacman/yay)
`sudo pacman -Syu inir-movies`, Windows: download the latest zip from
[Releases](https://github.com/TheDinnx/iNirMovies/releases/latest),
extract the whole thing over your old install folder, and run
`Install.bat` again. Either way, check Settings > Update afterwards
and confirm it shows 8.0.1 or newer, not just that it ran. If it is
still stuck on an old version after that, the package itself has not
been updated yet, not your install, please open an issue. If the
player does not start on Windows afterwards, run `FixMpv.bat` from
that same folder: it finds and repairs the bundled mpv on its own, no
typing required.

**Stuck on an old version and the in-app update does nothing?**
Releases before 8.0.1 shipped a binary that did not match its own
version number, so updating just reinstalled the same broken version
under a new name. This is fixed from 8.0.1 onward: Linux (pacman/yay)
`sudo pacman -Syu inir-movies`, Windows: download the latest zip from
[Releases](https://github.com/TheDinnx/iNirMovies/releases/latest),
extract the whole thing over your old install folder, and run
`Install.bat` again. Either way, check Settings > Update afterwards
and confirm it shows 8.0.1 or newer, not just that it ran. If it is
still stuck on an old version after that, the package itself has not
been updated yet, not your install, please open an issue. If the
player does not start on Windows afterwards, run `FixMpv.bat` from
that same folder (next to `iNirMovies.exe`): it finds and repairs the
bundled mpv on its own, no typing required. There is also a
"Fix mpv" button under Settings > Update that does the same thing
from inside the app.

## System requirements
- Windows 10 64-bit or newer, or a 64-bit Linux desktop (X11 or
  Wayland)
- 4 GB RAM, 500 MB free disk space
- Internet connection for browsing and playback
- Windows: extract the full zip, do not copy just `iNirMovies.exe`
  out on its own, the `tools` folder next to it is required
- Linux: no extra packages needed, everything required is bundled

**Sources: Cinemeta, Cinemana and Cinemana X**
The menu next to the search box picks the catalog. Cinemeta is the default
movie database and works on any internet connection. Cinemana and
Cinemana X are the same library with the same categories, languages,
qualities and request paths, only the address is different. Cinemana X
works on any Iraqi IP address, not only Earthlink, while Cinemana
(cinemana.shabakaty.com) works on Earthlink only. Pick whichever one
answers on your connection. The addresses of both sites are never
written to the logs and never shown in the player, they appear as
`Cinemana` and `Cinemana X`.

**Player keys**
`S` or `Enter` skips the intro or outro, `D` hides the skip button until
the next skip moment, `I` shows the file info (source name, resolution,
codec, decoder, cache, dropped frames) without any link, `F` toggles
fullscreen and `M` mutes. The mouse wheel changes the volume and a
sideways two-finger swipe on a touchpad seeks 5 seconds.

**Skip button text**
The skip button is English by default. Settings > Player lets you pick
Arabic, or type your own text for the intro, outro, recap and generic
skip buttons.

**Your own mpv options**
Create `mpv-user.conf` in the cache folder (Windows:
`%LOCALAPPDATA%\dinnx\movies`, Linux: `~/.cache/dinnx/movies`) and put one
mpv option per line, for example `volume=60` or `hwdec=no`. Lines that
start with `#` are ignored and your options are applied after the
built-in ones. The file `mpv.log` in the same folder shows what mpv
reported, and `debug.log` has an `[mpv-config]` line with the settings
that were really applied.

**Channels files**
The Channels tab opens any channels file. The format is detected from the
content: M3U, M3U8 and M3U_PLUS (group-title, tvg-logo, tvg-id,
`#EXTGRP`, `#EXTVLCOPT` user agent and referer), JSON in several layouts,
PLS, XSPF, and plain text lists with a name and a link per line. Entries
with the same name and category are merged into one channel with several
servers.