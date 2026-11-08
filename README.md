<div align="center">

<img src="assets/icons/appIcon.svg" alt="iNir Movies" width="120">

# iNir Movies

**Watch Cinemana movies, TV shows and live channels in one fast, simple app**

[![Latest release](assets/badges/release.svg)](https://github.com/TheDinnx/iNirMovies/releases/latest)
[![Download](assets/badges/download.svg)](https://github.com/TheDinnx/iNirMovies/releases/latest)
[![Platform](assets/badges/platform.svg)](#requirements)
[![Network](assets/badges/network.svg)](#important-earthlink-only)
[![License](assets/badges/license.svg)](LICENSE)

</div>

---

## Important: Earthlink only

iNir Movies is a desktop client for **Cinemana**, the streaming service
available through **Earthlink**, the internet service provider in Iraq.

Cinemana is only reachable from the Earthlink network. This means
iNir Movies **works only while your device is connected to an
Earthlink internet connection**. On any other provider (other home
ISPs, mobile data, public Wi-Fi) the catalogue will not load and
nothing will play. This is a limitation of Cinemana itself and not a
bug in the app, so please do not report it as one.

## Features

- Browse Cinemana movies, TV shows and live channels from one screen
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
2. Double-click `Install.bat`. It installs the app for your user,
   adds a Start Menu shortcut and installs [mpv](https://mpv.io) with
   winget if it is missing.
3. Launch **iNir Movies** from the Start Menu.

No installer is required to just try it: `iNirMovies.exe` also runs
directly from the extracted folder as long as `mpv.exe` is on your
`PATH`.

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
| Earthlink internet connection | Cinemana is only reachable on Earthlink |
| Linux or Windows, x86_64 | the release binaries target these platforms |
| [mpv](https://mpv.io) | plays movies, shows and channels |
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
its interface and resources are compiled and obfuscated, and the
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
