# Changelog

## 8.0.1
- The real cause of the endless "update available" loop since 7.8.6-2:
  release.sh had a leftover step that copied an old prebuilt binary
  over the freshly built one before packaging, every single release.
  Every fix shipped in 7.8.6-3 through 8.0.0 was built correctly but
  never actually reached anyone, because this silently replaced it
  with stale binary each time. This step is removed, and release.sh
  now runs the built executable and refuses to publish unless it
  reports the exact version being released
- Theme, effect and card size could silently reset back to Snowfall /
  Snow / Default while your real saved settings were still loading
  (more likely on a slow disk or a busy first load), because a
  startup safety timer treated "not finished loading yet" the same
  as "no settings file". It no longer resets anything itself
- New installs now default to the Cyber Core theme, its Cyber Grid
  effect, and Compact cards

## 8.0.0
- New: `scripts/setupPublicRepo.sh` sets up the public releases repo in
  one command, so `release.sh` has somewhere to publish to
- Fixed release.sh always writing "set version to 7.8.6-2" in its own
  commit messages no matter the real version being released
- Windows: rounded window corners, and a `FixMpv.bat` next to the app
  that finds and repairs a nested or missing mpv on its own
- README and FAQ now explain how to get off an old version by hand if
  the in-app updater is stuck, for both pacman and Windows installs
- Card size now defaults to Compact for new installs
- Cyber Core theme: corners are rounded again instead of sharp
  squares, and it has a soft two-tone glow backdrop behind the grid
- The Update tab now shows a dot after installing an update too, not
  only while one is available, until you open it and see what changed

## 7.8.6-5
- release.sh now refuses to publish if VERSION and the appVersion baked
  into MovieWidget.qml do not match, force-syncs the public repo's
  VERSION files right before publishing, and checks afterward that the
  release really was tagged correctly. This is what caused the tag and
  the running app to show different version numbers
- On Windows: fixed mpv not being found when it is nested inside the
  bundled tools folder, added a Windows app identity (AppUserModelID)
  and per-monitor DPI awareness, which likely explains the window
  showing no icon and the settings screen ignoring mouse clicks while
  touch still worked
- The icon is now loaded from the bundled .ico on Windows instead of
  the .svg, which needs a plugin that is not always bundled
- "Last checked" showed the time in Arabic (ر/م) even with English
  selected; it now always follows the app's own language
- The settings panel absorbs clicks inside it instead of letting a
  stray click fall through and close it
- Snow now uses actual six-point snowflake shapes for most flakes
  instead of plain soft circles

## 7.8.6-4
- Fixed the update check thinking a pacman-installed copy was not
  package-managed, which could send it into a loop of downloading and
  installing an update that never replaced the running copy. It is now
  confirmed by asking pacman directly, not only by the executable's path
- A reminder: VERSION, packaging/updates/VERSION and appVersion inside
  MovieWidget.qml must always be changed together with
  scripts/bumpVersion.sh, never by hand, or the published tag and the
  version baked into the binary can drift apart

## 7.8.6-3
- Added the Cyber Core theme: sharp corners app-wide, a neon border and a
  new Cyber Grid effect (scanline + falling glyph columns)
- Snow is calmer and softer: fewer, blurred flakes and far fewer glint
  sparkles instead of the sharp, flat, "electronic" look
- The network report said "MovieWidget" instead of "iNirMovies"
- Copy report and Copy IP now show a "Copied" confirmation, and fall
  back to xclip/xsel when wl-copy is not available
- Fixed the pacman package step failing with a "same file" error on
  the database symlink

## 7.8.6-2

**Fixes**
- Fixed the player and the tutorial sounds not starting on Linux:
  programs launched by the app, such as mpv and curl, were loading the
  app's bundled libraries instead of the system ones
- Saved settings were overriding the new defaults, so the theme, effect,
  window size and player profile are reset once to Snowfall, Snow,
  Default and Performance
- The About page now says GitHub repository instead of Developer

**Release checks**
- The build now runs the Windows app on a real Windows machine and the
  Linux app on the publishing machine before anything is published, and
  stops if either one fails

## 7.8.6-1

**Fixes**
- Fixed the Linux executable failing to start with an EGL and OpenGL
  error in 7.8.6
- Fixed pacman only offering an old version: the pacman package and
  repository database are now built and uploaded together with every
  release, so `yay -Syu` always sees the newest version
- The internet speed test now runs through curl and works on both
  Windows and Linux, with the previous method kept as a fallback

**New**
- Update section in Settings: checks GitHub for a new release, shows a
  notification and a badge on Settings, lists what changed, downloads
  with progress, speed and time left, checks the download against its
  checksum, installs it and restarts the app
- The automatic update check can be turned off in the same section

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
