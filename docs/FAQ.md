# FAQ

**Does iNir Movies work on any internet provider?**
No. It is built for Cinemana, which is only reachable from the
Earthlink network. On any other provider the catalogue will not load.

**Why does nothing load on my connection?**
Check that you are connected through Earthlink. Mobile data and other
internet providers cannot reach Cinemana.

**Why isn't the source code published?**
iNir Movies ships as a single compiled executable by design; see [SECURITY.md](../SECURITY.md).

**It won't launch on Linux.**
Make sure `mpv` and `xcb-util-cursor` are installed, then run
`iNirMovies` from a terminal to see the error.

**It won't play on Windows.**
mpv is bundled in the `tools` folder next to `iNirMovies.exe`. Make
sure you extracted the whole zip and did not move `iNirMovies.exe` out
of its folder, then check the logs below.

**How do I update?**
Download the newest release and run the installer again
(`installApp.sh` on Linux, `Install.bat` on Windows). It overwrites
the previous version.

**How do I uninstall?**
Linux: run `uninstallApp.sh`. Windows: uninstall **iNir Movies** from
Settings > Apps, or run `Uninstall.bat`.

**Where are the logs?**
The app closes itself when the player opens, so the logs are saved to
files. Windows: `%LOCALAPPDATA%\dinnx\movies\debug.log`. Linux:
`~/.cache/dinnx/movies/debug.log`. The player's own output is in
`mpv.stderr` and `mpv.stdout` in the same folder.

**Where are the logs?**
The app closes itself when the player opens, so the logs are saved to
files. Windows: `%LOCALAPPDATA%\dinnx\movies\debug.log`. Linux:
`~/.cache/dinnx/movies/debug.log`. The player's own output is in
`mpv.stderr` and `mpv.stdout` in the same folder.

**mpv not found on Windows?**
Run `FixMpv.bat` next to `iNirMovies.exe`. It looks for `mpv.exe` under
the `tools` folder, moves it back into place if it ended up nested one
folder too deep, and tests that it runs.
