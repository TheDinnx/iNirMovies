# Changelog

## 8.1.2
- New source menu instead of the Cinemana switch: Cinemeta, Cinemana
  and Cinemana X. Cinemana X is the same library on a different
  address, with exactly the same paths, categories, languages and
  qualities. Cinemana X works on any Iraqi IP address, Cinemana works
  on Earthlink only, so choose the one that answers on your internet.
  The choice is saved and switching reloads the catalog, the genres and
  the languages from the chosen address
- The addresses of Cinemana and Cinemana X are now hidden everywhere
  they could leak: debug.log, wrapper.log, diagnostics.log, mpv.stdout,
  mpv.stderr and mpv.log show only the names "Cinemana" and
  "Cinemana X". The file info in the player (I key) shows the source
  name, resolution, codec, decoder, audio, cache and dropped frames
  and never the playback link
- Rewrote how languages and genres are built. They now come straight
  from the categories response by their numbers (langNb) instead of
  being guessed from names or crawled page by page: every genre gets
  its language list instantly, ordered by how many titles it has, with
  the Arabic and English names the service sends. The old built-in
  language table had wrong numbers (it said 1 is English and 2 is
  Arabic, the real ones are 7 and 9) and is replaced by the full real
  table. Genres are ordered as the service orders them, names that arrive
  HTML-encoded, like "War & Politics", are decoded before matching, and Arabic genre
  names come from the service itself
- Fixed the page jumping down to Popular Movies / Popular TV Shows.
  When Search history, Watch history or Favorites finished loading the
  top part grew taller and the view stayed at the old position, so you
  landed in the middle of it. The page now stays at the top when you
  have not scrolled, keeps your place when you have, and switching
  between Movies, TV Shows and Channels always starts from the top
- Better loading screen: placeholders fade in and out instead of
  popping, the posters fade in when they arrive, and placeholders are
  not shown at all when cached posters are already on the page
- Translated the genres, the sort choices (newest, oldest, best,
  worst, A-Z, Z-A, most viewed and the rest) and the language names
  when Arabic is selected
- No more emoji icons: the empty Channels page, the missing poster
  placeholders and the API key notice now use drawn icons that follow
  the theme colors
- The skip button is English by default. Settings now lets you choose
  Arabic or type your own text for the intro, outro, recap and generic
  skip buttons. Press D in the player to hide the skip button until the
  next skip moment, S or Enter to skip
- mpv on Windows, full configuration support: hardware decoding uses
  the safe automatic mode, the cache size follows the memory of the
  computer instead of always asking for 8 GB, the player scripts are
  written at startup and waited for before every launch, and the player
  keys (wheel volume, sideways swipe seeks, F fullscreen, M mute) are
  part of the configuration
- Your own mpv options: put them one per line in mpv-user.conf in the
  cache folder and they are applied after the built-in ones on Windows
  and Linux. mpv.log and the [mpv-config] line in debug.log show what
  was really applied
- Touchpad scrolling on Windows is faster and lighter than the mouse
  wheel, and diagnostics.log records every mouse and touchpad Qt sees
- The Linux build installs the xcb libraries PyInstaller was
  complaining about, and prints a clear warning when a library goes
  missing again. The GitHub actions moved to current versions

## 8.0.7
- Fixed the loading screen layout. The grey placeholder cards used to
  be drawn over the whole page, on top of Recent Searches, Watch
  History and Favorites. They now start right under the Popular title,
  the Loading pill sits on the same line as that title, and the
  placeholders are skipped completely when the page already has cached
  posters to show while it refreshes
- "Popular Movies" and "Popular TV Shows" are now translated in Arabic
  (الأفلام الشائعة / المسلسلات الشائعة), the home section titles use the
  Arabic font when Arabic is selected, and the RapidAPI hint text no
  longer shows a raw variable name
- Redesigned the empty Channels page: a centered card with a TV badge,
  a short explanation of what file to pick, and the same button
- Windows: touchpad support. Two-finger scrolling now works up, down,
  left and right with a faster, lighter response than the mouse wheel,
  and the same smooth scrolling is shared by the mouse wheel. Inside
  the player the mouse wheel changes the volume and a sideways
  two-finger swipe seeks 5 seconds, tap pauses and double tap toggles
  fullscreen
- mpv configuration: the player scripts, the key bindings and the
  skip-intro, progress and stats scripts are now written when the app
  starts and the launch waits for them to exist before mpv starts, so
  the very first video on a slow Windows start can no longer open
  without them. mpv also writes its own mpv.log for every launch, and
  every playback logs the settings mpv really applied (video output,
  GPU context, hardware decoding, script options, key bindings and the
  mpv version) as [mpv-config] in debug.log
- New diagnostics.log next to wrapper.log: a start-up report with the
  Windows version, Qt version, screens and scaling, every mouse and
  touchpad Qt can see, the tools found, the PATH, the result of the mpv
  lookup, and the first mouse wheel and touchpad events with what each
  one scrolled. It rotates by itself at 1 MB
- Linux build: the missing xcb libraries that PyInstaller warned about
  are now installed before building, and the build prints a clear
  warning if a library goes missing again

## 8.0.6
- Windows: found the real reason the player never started even though
  mpv.exe was installed and "Fix mpv" reported everything fine. The
  mpv package ships a folder named "mpv" right next to mpv.exe. Inside
  the bundled shell, the command "mpv" finds that folder first and
  never tries mpv.exe, so every launch ended with "mpv binary not
  found" while running mpv.exe directly worked, which is why Fix mpv
  could not see the problem. The app now creates a small "mpv" launcher
  in tools\bin that points at the exact mpv.exe and puts it first on
  the PATH, and the launch scripts also fall back to mpv.exe by name
- Windows: at startup the app now checks that the bundled shell can
  find and start mpv by name, and writes the result to wrapper.log as
  [mpv-lookup] ok or ERROR. The Windows build on GitHub runs the same
  check and stops before publishing if it fails, so a broken player can
  no longer be released without anyone noticing
- "Fix mpv" in Settings > Update and FixMpv.bat now rebuild that
  launcher and test starting mpv through the app's own shell, not just
  running mpv.exe on its own
- Windows: the mouse wheel did not scroll anything (the middle button
  drag and touch worked). Wheel scrolling is now handled by the app
  itself on Windows: it finds the list or page under the cursor,
  scrolls it smoothly, stops at the ends, passes the scroll on to the
  page behind when a list reaches its end, and leaves the pop-up
  windows, the season switcher and the tab bar alone so they keep
  behaving as before. Shift + wheel scrolls sideways. The first few
  wheel events are logged in wrapper.log to make any remaining problem
  easy to track down. Linux is unchanged
- The loading screen for movies and shows, the channels loading screen
  and the "No channels file selected" screen no longer paint any dark
  layer at all, so the theme background and its effects show through
  everywhere instead of a flat dark panel
- The GitHub build pipeline moved to the current versions of its
  checkout, Python setup and artifact upload steps, which silences the
  Node.js 20 deprecation warning on every build

## 8.0.5
- Found and translated text that stayed in English even with Arabic
  selected: the Movies/TV Shows/Channels/Settings tabs, Search,
  Recent Searches, Watch History, Favorites, Back, Where to watch,
  Browse Alternative Sites, Try Next, Not working?, BEST,
  Get a Free API Key, Try Again, STREAM, RENT, BUY, LIVE, Fetching
  episodes..., Checking availability..., and the "all sources failed"
  message. The four main tabs also now use the Arabic font when
  Arabic is selected, instead of always using the English one
- Found the real cause of the loading/empty screens looking plain
  dark instead of showing the theme: three separate loading and
  empty-state panels (movies/TV loading, the channels empty state,
  and the channels loading skeleton) each had a nearly fully opaque
  flat color on top of the themed background, hiding it completely.
  All three are much more transparent now, so the theme's own
  background and effects show through
- The mpv "not found" log line now also records the full PATH it
  searched, to tell apart a packaging problem from mpv simply not
  being installed on that machine

## 8.0.4
- Found the real reason "Fix mpv" and the standalone `FixMpv.bat` were
  never there after extracting the Windows zip: the script that
  assembles that zip had a fixed file list and FixMpv.bat was never
  added to it, so it was silently left out of every release. It is
  now included, and the packaging script refuses to publish if any
  expected Windows or Linux file is missing, instead of staying quiet
  about it
- The in-app "Fix mpv" button now gets the real install folder
  directly from the app itself instead of guessing it, so it can
  actually find and repair mpv
- Windows: trying OpenGL instead of Direct3D for rendering, as a
  targeted test for the settings screen ignoring the mouse while touch
  still works. Not confirmed yet, please test and report back either
  way
- Removed the pulsing white glow at the bottom of the snow effect, and
  the drifting white fog shapes that were also sitting near the
  bottom, not just the one gradient found earlier
- Default subtitle language is now English instead of Arabic
- Removed the soft glow band at the top of the snow effect too, so
  nothing but the falling flakes themselves remains
- Documented minimum system requirements in the README

## 8.0.3
- Pacman-managed installs now get an "Update now" button in-app
  instead of a yay command to type: it asks for your password through
  a graphical prompt (or opens a terminal if none is available) and
  runs pacman itself
- Windows: added a "Fix mpv" button under Settings > Update that finds
  and repairs a missing or misplaced mpv on its own
- "Copy report" and "Copy IP" showed nothing after copying because the
  "Copied" confirmation was placed outside the button's own clipped
  area and was never visible. The button's own label now changes to
  "Copied" instead
- Cyber Core's background was so close to pure black that empty and
  loading screens looked unthemed; it now keeps a visible dark navy
  tint instead

## 8.0.2
- The window's own background now always matches the selected theme,
  instead of a fixed dark navy. This was most visible on Cyber Core:
  during loading or a layout change, the mismatched color could show
  through and look like the theme had reset or gone black
- Button and UI sounds sometimes did not play because rapid clicks
  were being collapsed into a single sound. Every click plays its
  sound now
- "Copy IP" shows a "Copied" confirmation, same as "Copy report"
- README: clarified that the pacman/zip update instructions only
  start working from 8.0.1 onward, since earlier releases shipped a
  package that did not match its own version number

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
