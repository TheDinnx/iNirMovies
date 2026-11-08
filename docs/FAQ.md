# FAQ

**Does iNir Movies work on any internet provider?**
No. It is built for Cinemana, which is only reachable from the
Earthlink network. On any other provider the catalogue will not load.

**Why does nothing load on my connection?**
Check that you are connected through Earthlink. Mobile data and other
internet providers cannot reach Cinemana.

**Why isn't the source code published?**
iNir Movies ships as a single compiled, obfuscated executable by
design; see [SECURITY.md](../SECURITY.md).

**It won't launch on Linux.**
Make sure `mpv` and `xcb-util-cursor` are installed, then run
`iNirMovies` from a terminal to see the error.

**It won't play on Windows.**
Make sure `mpv.exe` is on your `PATH`. Running `Install.bat` installs
it with winget when it is missing.

**How do I update?**
Download the newest release and run the installer again
(`installApp.sh` on Linux, `Install.bat` on Windows). It overwrites
the previous version.

**How do I uninstall?**
Linux: run `uninstallApp.sh`. Windows: uninstall **iNir Movies** from
Settings > Apps, or run `Uninstall.bat`.
