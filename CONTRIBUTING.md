# Contributing

This repository only hosts packaging, installer scripts and release
metadata for iNir Movies. The application itself is distributed as a
compiled binary through GitHub Releases and is not open source.

## What belongs here

- `packaging/linux` — desktop entry, install and uninstall scripts
- `packaging/windows` — PowerShell installer, uninstaller and launchers
- `scripts` — release build and upload scripts
- `assets` — the app icon and screenshots used in this README
- `docs` — the changelog and FAQ

## Opening a pull request

1. Fork the repository
2. Create a branch for your change
3. Keep shell scripts clean under `shellcheck`
4. Use conventional commit messages such as `feat(linux): ...` or
   `fix(windows): ...`
5. Open a pull request describing what changed and why

Requests for the application's source code will not be accepted.
