# Changelog

## 7.8.6

**Windows**
- Fixed an empty window with no posters or catalog on Windows PCs that
  do not have Git installed: the app now ships its own bash and mpv in
  a `tools` folder and no longer depends on anything installed on the PC
- Fixed mpv not starting when a resolution is picked on Windows
- Fixed the tutorial sounds not playing; the longer sounds exceeded the
  Windows command-line limit, so they are now written to a file first
- Fixed cache and saved-state writes failing on Windows when they were
  large
- Fixed links not opening in the browser on Windows
- The window title bar is now dark and matches the app instead of white
- Added an application icon to `iNirMovies.exe`
- The installer no longer needs winget or a separate mpv install

**Logs**
- The debug log and the mpv output are now stored in the app cache
  folder instead of `/tmp`, so they can be read after the app closes
  itself for the player (Windows: `%LOCALAPPDATA%\dinnx\movies\debug.log`,
  Linux: `~/.cache/dinnx/movies/debug.log`)
- Added `wrapper.log` for process launch failures

**Defaults**
- Window size now defaults to Default instead of Smart
- The theme now defaults to Snowfall with the Snow effect
- The player profile now defaults to Performance
- Added a Skip button language setting, Arabic by default with English
  optional
- The app now starts normally even if the saved state cannot be read

**Other**
- The Developer link now points to the iNirMovies repository

## 7.8.5

**Tutorial / guide**
- Added a sound effect when the guide opens, when it closes, when going
  back a step, and a distinct sound for each forward step (18 unique
  step sounds plus a finishing fanfare), instead of one repeating sound
- Fixed sounds overlapping or playing twice when steps were advanced
  quickly; only one sound plays at a time now
- Fixed the guide's language dropdown rendering oversized and
  overlapping the rows below it
- Fixed the primary "OK / Finish" button's progress-fill overlay (shown
  while Auto-advance is counting down) rendering as a hard-edged square
  instead of following the button's rounded corners
- Fixed the guide's pause icon on the "Auto" toggle having sharp,
  square-looking corners instead of rounded ones
- Turning "Auto" off now actually pauses the guide instead of only
  stopping the automatic countdown
- Added two new guide steps covering Appearance, Player settings, About,
  and a guide-controls / keyboard-shortcuts step

**Window and layout**
- Fixed background particle effects (snow, embers) visibly jumping to a
  new position after a resize or after the window was hidden and shown
  again, by driving their motion from an elapsed-time clock instead of
  a fixed animation offset
- Fixed the window-size setting (Full / Default / Smart) not actually
  being re-applied on restart; the saved choice is now applied, not
  just stored
- Fixed the one-time intro (fade and slide) animation replaying every
  time the window was minimized and restored; it now plays once per
  session
- Reduced the default card size slightly across the Movies, Search and
  Channels grids for a more compact grid

**Player**
- Added a player shortcut (D) to dismiss the current skip-intro button
  without performing the skip

**Branding and distribution**
- Renamed the app to iNir Movies, with a new icon
- Packaged the app as a single compiled executable, with the interface
  compiled into a binary resource bundle and the third-party API key
  obfuscated, rather than shipping plain QML/Python source
- Added a Windows build alongside the existing Linux build
- Releases now ship as two files, `iNirMovies-linux.tar.gz` and
  `iNirMovies-windows.zip`, each with its own install and uninstall
  scripts, plus a `SHA256SUMS` file
- Added a Windows installer that installs for the current user, adds a
  Start Menu shortcut, registers an uninstall entry in Settings and
  installs mpv with winget when it is missing
- Published packaging only (install scripts, desktop entry, icon) in
  this repository; the application itself ships only as a compiled
  binary attached to Releases

## 7.5.1
- Initial packaging
