# Changelog

## 8.6.1
- Tutorial: all 23 tutorial sounds are new again, softer and warmer. Every step plays a short plucked-string phrase on a calm pentatonic scale that climbs gently as the tour moves forward, so nothing clashes and nothing sounds sharp. The start, finish and exit sounds are fuller, with a soft pad and a deep low note, and the tip sound is lighter and quieter so it never gets tiring.
- Tutorial: the sounds are stored under a new cache name, so the new ones replace the old ones automatically the first time they play, and the old files are deleted. The playback volume is a little lower.
- Linux: removed the Arabic comment line from the application menu entries of iNir Movies and iNir Admin.
- Admin on Windows: the program is now called iNir Admin everywhere. The executable is iNir Admin.exe, the file properties and the Task Manager name read iNir Admin, and the settings folder is %APPDATA%\iNir Admin. Settings saved in the old iNirAdmin folder are moved there automatically.
- Admin: ready-made executables. iNir Admin.exe for Windows and inir-admin for Linux are built on this machine together with the app, and the release step publishes them as a release in the build repository. The Linux archive includes an install script that adds iNir Admin to the application menu.
- Admin: buildExe.ps1 now builds a single iNir Admin.exe in dist\admin, and exported backups are named iNir-Admin-backup.
- Release: bumped the app and updater to 8.6.1.

## 8.6.0
- Window: on Windows the title bar with the minimize, maximize and close buttons no longer disappears after changing the window mode or leaving full screen. The window size and position are now applied only after the window has finished changing state, and a guard restores the missing frame and caption buttons if Windows drops them.
- Scrolling: on Windows, scrolling past the end of the movie, TV show or search lists, or over a list that fits the screen, no longer moves the cards behind it. The wheel is absorbed by the list under the pointer instead of leaking to the layer underneath.
- Scrolling: the mouse wheel over the Continue Watching, Watch History, Favorites and Recent Searches rows now scrolls the page up and down instead of sliding the row sideways. Use Shift with the wheel to move a row sideways.
- Tutorial: replaced all 23 tutorial sounds with new original melodic sounds. Each step has its own short phrase that rises as the tour moves forward, and the start, tip, guide, finish and exit sounds are fuller stereo pieces with a soft pad and bell tones.
- Linux: the application menu entry is now named iNir Movies instead of iNirMovies, with its icon, categories and keywords, and the same entry is used by the installer and the package.
- Admin: the icon is the same as the iNir Movies icon on Linux and Windows.
- Search: fixed the white vertical bar that appeared inside the search box on Windows when the app opened. The text cursor is now drawn in the theme accent color and only shows once you type or point at the box, and the selection color follows the theme.
- Pointer: the season buttons (S1, S2, ...) now show the hand cursor and react to the mouse with a light hover effect, and the tutorial text box shows the hand cursor too, so every clickable part of the app now gives feedback.
- Performance: posters, cast photos, episode pictures, channel logos, provider logos and the blurred cast background are now decoded at the size they are displayed instead of their full size, which cuts memory use and makes scrolling and opening windows smoother, especially on Windows.
- Performance: poster grids no longer build mipmaps for every poster, saving GPU work while the lists load.
- Performance: search results now fade in with one light animation instead of moving, scaling and fading every card together, so large result lists appear faster.
- Admin: every button, toggle, tab, theme chip, effect chip, sidebar item, lock button and close button now shows the hand cursor.
- Admin: buttons, toggles, tabs, chips and sidebar items react to the mouse with a hover shade, a press effect and a slight grow, and the effect clears the moment the pointer leaves, so no control keeps a stuck state.
- Admin: toggles stretch their knob while pressed and show a clearer border on hover.
- Admin commands: each group now has Allow group and Restrict group buttons that work for everyone or for the selected device or IP, and a red counter shows how many commands in the group are restricted.
- Admin commands: the search box has a clear button, and every command card reacts when the pointer is over it.
- Admin backup: new Backup card in Settings. Export saves the commands, restrictions per device or IP, bans, notices, maintenance, banner, theme, minimum version and admin devices to a JSON file, and Import and replace or Import and merge loads it on any device. Merge keeps what is already there and adds the new entries without duplicates. The file never contains the token or the PIN, and an imported backup is added to the draft so it reaches users when published.
- Admin on Windows: the panel now runs on Windows. Settings and the encrypted vault are kept in the AppData folder, the vault key uses the Windows machine identifier, command and ID fields use Consolas, and the title bar follows the dark theme.
- Admin on Windows: added icon.ico with every size from 16 to 256, a run.bat launcher without a console window, install.ps1 that installs PySide6 and adds iNir Admin to the Start menu and desktop with its icon, and buildExe.ps1 that builds iNirAdmin.exe with the icon. scripts/makeAdminIcon.py rebuilds the icon from the SVG.
- Admin: added a ready-made inir-admin.desktop file with the name, icon, categories and keywords. install.sh and the admin window now build the menu entry from it, so iNir Admin appears in the application menu with its own icon.
- Release: bumped the app and updater to 8.6.0.

## 8.5.4
- Startup: the app now reads and writes its saved state directly instead of starting a shell for every file, so Windows no longer waits for slow shell start-up and then opens as if it were a fresh install.
- Startup: signed-in accounts keep a complete local copy of their settings and data, so the saved theme, section, source and library appear immediately instead of after the account sync finishes.
- Startup: older installs that only have a partial local copy no longer show the theme setup, the tutorial or the default Cinemeta catalog while the account sync is still loading. The first catalog request waits for the account preferences.
- Account sync: a failed or slow sync is retried with a request timeout, and a device that already has an account is no longer blocked by the first-run screens when the sync cannot be reached.
- Account sync: the section and source chosen on this device are kept when the account data arrives.
- Catalog: pressing Movies or TV Shows no longer reloads a catalog that is already loaded for the current source, genre, sort and language. Switching sections is instant and no longer repeats the large Cinemana download.
- Catalog: requests are cancelled and ignored once a newer one starts, so switching sections, sources, genres or sorting quickly cannot mix results or pile up requests that could close the app.
- Catalog: the Cinemana catalog is saved on disk per source, so the selected source loads from its own cache on start and refreshes in the background when it is older than twenty minutes. At start only the visible section is requested.
- Continue Watching: titles containing an apostrophe are saved as valid data again.
- Cache files are written atomically with a backup, so an interrupted write can no longer leave a damaged file.
- Admin: buttons, tabs, toggles and chips release keyboard focus when pressed and return to their normal state as soon as the pointer leaves, so text fields and buttons no longer keep the blue focus state.
- Source: Cinemana is now the default source, and a fresh or empty state opens on Cinemana instead of Cinemeta.
- Admin: the window now registers its own application id, desktop entry and icon, so the task switcher and the taskbar show the iNir Admin icon instead of the Python icon.
- Release: bumped the app and updater to 8.5.4.

## 8.5.3
- Sources: wait for saved preferences before the first dashboard request, and skip the shared Cinemeta Trending cache when Cinemana or Cinemana X is selected.
- Sources: preserve the legacy Cinemana-enabled preference when older saved source fields disagree, so the selected Cinemana catalog loads instead of Cinemeta.
- Home layout: relayout movie, TV and search grids after window resizing and state restoration so cards use the final available dimensions.
- Release: bump the app and updater to 8.5.3.

## 8.5.2
- Playback: prevent mpv startup failures by passing Continue Watching paths and account markers through environment variables instead of percent-encoded `script-opts`.
- Playback source: honor the currently selected Cinemana/Cinemana X mode at every playback start instead of relying on a potentially stale boolean.
- Release: bump the app and updater to 8.5.2.

## 8.5.1
- Admin devices: show the hardware model before the Linux distribution, or the model before Windows. Device host names are neither displayed nor sent.
- Admin devices: refresh previously generated model/distribution labels on check-in without overwriting names manually assigned in Admin.
- Admin pointer: remove button hover highlights and detached hover handlers so neither the cursor nor a blue hover state can stick after leaving a control.
- Continue Watching: mark new account playback before mpv handoff, poll player saves while the app is open, and sync progress updates immediately.
- Continue Watching: use unique progress markers and clear only the exact version accepted by the server, retaining newer saves during overlapping syncs.
- Continue Watching: save a local player-readable copy for mpv, track pending progress changes and merge them back into the signed-in account on its next sync.
- Continue Watching: write player progress atomically, retain unfinished positions and remove completed videos from the list.
- Home, search and channels: adapt Compact poster columns to the actual grid width so cards remain readable in narrower windows and use wide windows consistently.
- Admin: remove hover highlights that could remain blue after leaving a control, and show the iNir Admin SVG icon in the QML window title bar and task switcher.
- Release: keep the app and updater version at 8.5.1.

## 8.5.0
- Admin devices: the app now reports the computer's host name to the control server, so the device list shows the real device name instead of "Unnamed device".
- Admin devices: old device records with no name are filled in on the next check-in. Manually assigned names are preserved and are not overwritten by the computer name.
- App and server: device names are sent with both control checks and heartbeats, and are safely limited in length before storage.
- Admin list: records that have not yet sent a device name show their device ID instead of the misleading "Unnamed device" label.
- Release: raised the app and updater version to 8.5.0 for the matching client and server update.

## 8.4.7
- Google sign-in: the account form remains usable while the external browser is open. The sign-in and create-account tabs can still be changed, Google sign-in can be canceled, and closing the browser no longer leaves the app stuck waiting.
- Google sign-in: canceling closes the pending local OAuth listener; browser-launch failures and timeouts now release the pending state. The Google button icon remains still instead of spinning.
- Device identity: the app now saves and restores its device ID from local application configuration, so reopening the app keeps the existing device record.
- Admin: mouse hover feedback clears when the pointer leaves a button, including after a canceled or completed press.

## 8.3.0
- Theme links: the shared theme page now plays the real effect of the theme (all 32 effects are drawn on the page, in the shared colors, intensity and speed) instead of the same falling dots every time. Links made by older versions still show the right effect, because the page now looks up the effect of the theme itself when the link was saved with Auto.
- Theme links: the Open in iNir Movies button now really opens the app. iNir Movies registers itself as the handler of inirmovies:// links on Linux and Windows the first time 8.3.0 starts, and the link opens the full preview in the running app, or starts the app and opens the preview if it was closed. The page also has a Copy link button and a message that explains what to do when nothing opens.
- Theme links: the Share theme and effect button now saves the effect that is really running, not the word Auto, so what you share is what the other person sees.
- Cast: the small bar at the bottom is removed. Starting a cast now goes straight to the full screen TV remote, and the cast button in the top bar reopens the remote while a cast is running. Closing the remote keeps the cast playing, and Stop casting is inside the remote.
- Channels: the channels file you choose is now saved inside the app. If the original file is moved, renamed or deleted, or the app starts without the saved path, the channels still load from the saved copy. Choosing another file replaces the saved copy.
- Themes: the theme studio now has a Share theme button, in the top bar next to Close and next to Done at the bottom. It creates the link of the theme and effect you are previewing, and the share and preview windows now open above the studio.
- Developer control: a ban on a button or a command, a theme push, a banner or any other change from the admin panel now reaches open apps within about 15 seconds, with no restart. The app asks the server for a small revision number every 15 seconds while its window is visible, and downloads the full control file only when the number changed. The full check every 5 minutes stays as it was.
- Release: the release commit for the app now carries the notes of the version being released instead of an old fixed message, and any leftover fixed text like bump version to 7.8.6-2 in publish.sh is rewritten to the real version before publishing.

## 8.2.8
- Cast: the full screen remote no longer shows the poster of a movie you opened earlier. It shows the poster of what is really being cast, the channel logo for channels, or no picture when there is none.
- Cast: when you cast a live channel the remote shows a LIVE badge and hides the subtitle preview, the seek bar and the jump buttons, because a live channel cannot be jumped, and only play and pause stay.

## 8.2.7
- Cast: when a TV cannot jump inside a stream with burned-in subtitles (Hisense), the app now fixes it by itself. It switches that TV to a seekable stream, remembers the choice for that TV, and jumps to the position you asked for. After that, back and forward work on that TV every time.
- Account picture: the picture is now drawn through the canvas image loader and checked before it is saved. A blank or white result is never uploaded; the app redraws it, and shows a message if the picture cannot be read.
- Log: removed the deprecated Qt.atob call, fixed the palette property that overrode the Rectangle palette, and the release now replaces an invalid Qt style override such as Darkly with Fusion.

## 8.2.6
- Cast: the Hisense jump problem is fixed on the app side. The seek bar no longer snaps back when the TV answers with its old position, it stays enabled even when the TV does not report the movie length, the position keeps counting when the TV stops reporting it, and every jump is checked and retried up to three times before an explanation is shown.
- Cast: a new full screen remote opens from the monitor button on the cast bar. It has back 30 s, back 10 s, play and pause, forward 10 s, forward 30 s, a big seek bar, the movie poster as background, and keyboard keys (left, right, space, Escape).
- Cast: the remote shows a live subtitle preview that uses the player's subtitle size, color, background and fonts.
- Screen: playing on a screen of this computer now uses a huge cache (up to 4 GB ahead and 2 GB behind, 2 hours of readahead) so large movies and heavy streams do not stall.
- Account picture: fixed the picture saving as a blank white circle on the first try. The picture is now checked after drawing and redrawn until it really contains the image, big pictures are decoded at a safe size, and choosing another picture while one is still saving is ignored. This also fixes the crash when choosing several pictures.
- Fixed the log spam QML NumberAnimation setPaused() cannot be used when animation isn't running in the tutorial.
- Themes: new Share theme and effect button in Settings > Appearance. It creates a link for the theme with its effect, intensity, speed, corners and glow, and Copy link puts it on the clipboard.
- Themes: a new Open a theme link box and a full preview screen with the live effect, a mini app preview in the shared colors and one tap to apply the theme and its effect.
- Themes: the web page of a shared link is redesigned with the animated effect, the colors, a mini app preview and an Open in iNir Movies button.

## 8.2.5
- Account: signing in with Google now brings your Google name and your Google profile picture. The picture shows in the account card instead of the first letter, and the name replaces the username there. The control server fetches them from Google, so they come back right after every sign in.
- Account: you can set your own picture. Settings > General > Account has a Set picture button that opens the file picker for images, crops the picture to a square, shrinks it and saves it on your account on the control server. It follows you to every device. Reset picture goes back to your Google picture, or to the letter when there is none.
- Account: the name and the picture are loaded again every time the app starts while you are signed in, and cleared when you sign out or delete the account.
- Google sign in: the release now makes sure the Google sign in asks for the profile permission, which is what allows the name and the picture to come through.
- Release: the test that starts the built Linux executable now waits until the sound files really exist (up to 90 seconds) instead of stopping after 15 seconds, and finds them in any cache folder. This fixes the "started but the shell scripts did not run" failure.
- Sounds: the tutorial sounds are now written by one self-contained shell command, so a missing cache folder can no longer stop them from being created.
- This version includes everything from 8.2.2 and 8.2.3, listed below.

## 8.2.3
- Update: the app now updates itself directly from the downloaded release, with no package manager and no terminal command. The Update now button always works, the broken box that overlapped the Update now, Check again and Release page buttons is gone, and the buttons sit in one clean row.
- Update: if an older copy was installed through pacman, the first in-app update installs the new copy for your user and removes the old pacman package for you, so only one copy remains.
- Account: fixed Create account and Sign in failing with Could not reach the server. The password hashing on the control server used more rounds than Cloudflare allows. The error message now also shows the server status code.
- Admin panel: the Google sign in card now lists the exact steps to get the Client ID and Client secret, with a button that opens Google Cloud Console.
- Release: releases no longer build a pacman package, and the control server is redeployed automatically whenever its code changes.

## 8.2.2
- Casting to a TV now guarantees subtitles show up: the first time you connect to a new TV you pick Arabic or English once, and the app burns the subtitle into the picture (needs ffmpeg) so it isn't left up to the TV's own subtitle support.
- Casting now has a real transport bar: play/pause, a draggable seek bar, and live position while casting to a smart TV or Chromecast.
- New optional account: create one from Settings → General and your settings, favorites, watch history, continue watching and search history are saved on your account instead of this device. While you are signed in none of them is written to the device, the device ID and device paths stay local, and the first sign in moves what was already saved here to the account.
- Developer control now checks in every 5 minutes instead of keeping a connection open, and the server only records a device about every 30 minutes, so the free control server keeps working for a large number of users.
- Account: a new Continue with Google button signs you in or creates the account with your Google account, the same account and the same synced data on every device.
- Admin panel: a Google sign in card in Settings where the developer pastes the Client ID and Client secret and turns Google sign in on or off.
- Theme sharing: share your current theme as a link; opening it previews the theme and applies it with one tap.
- Fixed the admin dashboard's "Downloads" stat being unclear (it's the lifetime GitHub release download count, now labeled as such) and made the admin panel's navigation buttons give proper press/hover feedback.

## 8.2.1
- 

## 8.2.0
- Window: a new Full screen choice in the Window size setting. The app covers
  the whole screen without the title bar and the layout adapts to it. It is
  remembered after a restart. F11 still switches full screen on and off
- Network: the Download and Upload tiles no longer have icons and keep their
  text in the exact middle. After the test finishes the gauge goes back to
  Download with -- instead of staying on the last result
- Update: the scroll bar of the what changed box is moved away from the text
- Channels: restarting while you were on the Channels tab now loads the
  channels right away instead of staying on Loading channels. Saved custom
  links show up at once when no channels file is selected
- Fonts: the default font is always the first choice in the English and Arabic
  font lists, so you can go back to it after picking another font
- Icons: some icons now move when they have something to say. The scan icon
  spins while searching for devices and while the network test runs, the cast
  icon pulses while casting, and the download icon bounces while a download is
  running
- Device ID: every install has an ID you can copy from Settings, Update
- Developer control: a new control service lets the developer manage the app
  live. Users can see notices and banners, a maintenance screen, an update
  required screen, and a ban screen with the reason. A ban by device or by IP
  can also close the app. The developer can turn any command off or on for
  everyone or for one device or IP, and a turned off command shows a red box
  with a ban icon. The developer can also push a theme and a background effect
  to everyone. Nothing happens until a control server address is set in the
  app
- Admin panel: a private admin app in the admin folder with live numbers,
  devices, bans, commands, notices, appearance, controls and history, in English
  and Arabic, with the app icon, the Lunacore theme and the Light rays
  effect. It is not part of the released app
- One command: go.sh now also installs the admin panel and deploys the free
  control server before it builds and releases

## 8.1.8
- Window: the Window size setting now controls the real window of the app,
  the interface is no longer shrunk with a frame around it. Smart maximizes the
  window to fill the screen, Default is a standard centered window and Custom
  lets you choose the exact width and height. The layout adapts inside the
  window to its size. F11 switches full screen on and off
- Network: the Download and Upload tiles are centered, the icon and the text
  now sit in the middle of the tile
- Settings: the General icon is now a house icon, in the header, in the side
  list of the tour and in the tour chips
- Update: the what changed box has a visible scroll bar and scrolls with the
  mouse wheel and the touchpad, so long notes can be read to the end
- Fonts: choosing a font now applies at once and is saved, and the box shows
  the real name of the chosen font instead of the old one. A font picked with
  Browse is remembered, appears in the list with the other fonts and is
  available again after a restart. The list always opens, with the right height.
  The list shows only fonts really installed on your system plus your saved
  fonts, so picking a font always changes something. Noto Sans Arabic and
  Noto Kufi Arabic are no longer reset to the default after a restart, and a
  saved font whose file was deleted is removed from the list
- Live preview in the Theme Studio now shows Liquid Glass, Frosted and Aero
  glass on the preview, its tabs, search bar, cards and buttons

## 8.1.7
- Liquid Glass is now real: a refraction shader bends and splits the
  background near the edges of every panel like Apple's Liquid Glass, over a
  live blurred copy of the app, with a moving specular rim, edge glow and soft
  gloss. It applies to dialogs, cards, buttons, toggles, switches and combo
  boxes. Themes with it: Liquid Glass, Liquid Glass Light, visionOS, tvOS,
  iOS Dark, iOS Light, macOS Dark and macOS Light
- Frosted glass for Windows 11, Windows 11 Light and Windows 10 (strong blur,
  no refraction), and Aero glass for Windows Aero and Frutiger Aero (glossy
  rim, light refraction)
- 32 more core themes: Normcore, Gorpcore, Barbiecore, Balletcore, Dollcore,
  Bardcore, Cutecore, Traumacore, Liminalcore, Poolcore, Nostalgiacore,
  Vampirecore, Darkcore, Spacecore, Oceancore, Animecore, Gamercore, Hexcore,
  Dragoncore, Forestcore, Rainbowcore, Sweetcore, Hackercore, Cybergoth,
  Beachcore, Grandmacore, Crystalcore, Lunacore, Sunsetcore, Autumncore,
  Springcore and Industrialcore, each with a matching effect
- Tutorial: the tour no longer starts while you are still choosing the
  language and theme in the first screen. It starts only after setup is done
- Quality dialog: the title is now the movie or episode name and the
  resolution is shown under it
- Settings: removed the icons from the side menu, and the language row has a
  languages icon instead of the EN badge
- Channels: Sort with images first now ranks channels whose logo really loads
  first. Logos that fail to load are remembered and moved down, and the list
  re-sorts by itself shortly after new logos load or fail
- shaders/glass.frag.qsb is built from scripts/shaders/glass.frag with
  qsb --qt6 --glsl "100 es,120,150" --hlsl 50 --msl 12

## 8.1.6
- Icons: fixed the icons that came out too big and out of place in the
  Theme Studio, the chips, the buttons and the settings headers, because
  a layout ignored the icon size. Fixed the settings tabs where some icons
  showed as black dots and others did not show at all, because the icon
  color was not a valid SVG color and closed shapes were filled black
- First screen redesign: a centered welcome with only iNir Movies as the
  title, a moving light line under it, an animated aurora background,
  Choose your language in English and Arabic on two lines, larger language
  cards and a Continue button right under them
- Six more effects, now 34 and grouped by type: Retro grid with a sun,
  Dust, Spores, Clouds, Gears and Hearts, each fully animated
- 24 more themes, one for every core style: Fairycore, Kidcore,
  Weirdcore, Angelcore, Cloudcore, Mushroomcore, Bloomcore, Froggycore,
  Mermaidcore, Royalcore, Ghostcore, Techcore, Coquette, Sleepycore,
  Wintercore, Fantasycore, Piratecore, Vapor Sunset, Retrowave, Academia
  Dust, Steam Gears, Dream Clouds, Gothic Hearts and Space Grid, each
  paired with a matching effect. Retrowave, Vapor Sunset and Techcore are
  featured
- Google TV and Chromecast: Cast to TV now finds Google Cast devices and
  plays on them. Subtitles are converted to WebVTT and served from this
  computer so the TV can load them. Hisense, Samsung, LG and Sony TVs work
  through DLNA, Google TV Hisense models through Google Cast, and
  subtitles are also sent to DLNA TVs
- Subtitles for downloads: when you download a movie or an episode the
  Arabic, English and other subtitle files are now saved next to it with
  the same name, so any player loads them
- Playing on an HDMI or DisplayPort screen keeps using the same subtitle
  settings as the normal player
- New themes: Nothing OS (dark, light and Glyph with a dot matrix
  effect), One UI Light, Galaxy AI, Liquid Glass Light, tvOS, Realme UI,
  ColorOS, Flyme, webOS, Roku, Android TV, Fire OS, Wear OS, Zorin OS,
  openSUSE, Gentoo, FreeBSD, Haiku, Plan 9, TempleOS, Windows 3.1,
  Mac OS 9, NeXTSTEP and BlackBerry, and a new Dot matrix effect
- Six more effects, now 28 in total and grouped in the Theme Studio by
  Basic, Nature, Space and light, Fire and energy, Digital and retro and
  Fun: Waves, Color flow, Light rays, Glitch, Lanterns and Dot matrix
- 33 more animated themes (Ocean Waves, Color Flow, God Rays, Glitch
  City, Lantern Festival, Neon Rain, Midnight Aurora, Dot Matrix and
  more). The Theme Studio opens on a new Featured tab with the best
  themes first, and in every list the featured themes come first, then
  the animated ones, then the rest
- The default button shape is now Pill. The selected theme card check
  mark is centered
- Cast to TV: a new button next to the source selector finds smart TVs
  on your network (DLNA and AirPlay) and screens of this computer such
  as HDMI or DisplayPort. Once a target is chosen, every quality you pick
  and every channel plays on it instead of opening the player, and
  subtitles are sent along. Turn it off from the same button
- Choosing a quality now asks what to do with it: play, download or
  cast. Downloads ask where to save, and a Downloads list appears only
  after you start one, with progress, cancel, open folder and remove
- Channels accept big category files like the ones from IPTV panels
  (a categories object with name, stream_id, logo and url), keep their
  categories and show the first 3000 results with a hint to use search
  or a category
- Channels can be sorted: default, with images first, with images last,
  A to Z and Z to A
- Play any link: paste a stream address, optionally set a name, user
  agent and referer, play it right away or save it to My links
- Channels no longer hide the app the moment you press them: a
  "Starting the channel" screen shows until the player really starts,
  and only then does the app close
- The speed test now behaves like Speedtest: the number moves live from
  the first second, it measures ping, download in blue and upload in
  purple, and it no longer waits on a placeholder
- Fixed the repeated "mv: cannot stat debug.log.tmp" lines in the
  terminal and a layout warning in the Windows settings card

## 8.1.5
- New Theme Studio. On the first launch the app asks for your language,
  Arabic or English, then opens a full screen studio where you pick the
  theme, the background effect and the button shape, and everything
  changes live behind you. You can open it again any time from
  Settings > Appearance > Theme Studio. People who already use the app
  are not interrupted and can open it from Settings
- 145 new themes, 172 in total, grouped into Systems (Windows 11, 10, XP
  and 95, Aero, macOS, iOS, visionOS, Material You, One UI, HyperOS,
  HarmonyOS, ChromeOS, Ubuntu, GNOME, KDE, Fedora, Arch, Mint, Pop!_OS,
  Debian, Kali, Amiga, BeOS, Commodore 64, DOS, terminals, PlayStation,
  Xbox, Switch, SteamOS and more), Games (Minecraft, Cyberpunk, Zelda
  style, Halo, Valorant, Pac-Man, Tetris, DOOM, Elden Ring, Pokemon,
  Fallout and more), Apps (Spotify, Netflix, Discord, Twitch, YouTube,
  Telegram, WhatsApp, GitHub, Notion, Figma and more), Aesthetics
  (Cottagecore, Synthwave, Vaporwave, Y2K, Dark Academia, Lo-fi,
  Solarpunk, Kawaii and more) and extra classics including High
  Contrast and a colorblind safe theme. Themes that have motion are
  tagged as animated
- Search for a theme by name, in English or Arabic, and filter by
  category, in the Theme Studio and in Settings > Appearance
- Five new background effects: Sparkles, Confetti, Pixels, Scanlines
  and Aura, and every effect now has an icon. Picking a theme now
  brings its own effect, and you can change the effect and its
  intensity (Calm, Balanced, Lively) with a live preview
- Button shape: choose Square, Rounded or Pill, with a preview, in the
  Theme Studio and in Settings > Appearance. It applies to buttons,
  cards, fields and tabs across the whole app
- Small icons on the settings tabs and section titles

## 8.1.4
- Fixed the settings text boxes staying selected: the custom skip
  button boxes kept their highlighted border after the mouse left and
  stayed that way when it came back. Now the box is released when you
  click anywhere else, press Enter or Escape, and a box only lights up
  while the mouse is really over it
- The search box no longer stays highlighted after the mouse leaves
  it: it lights up while the mouse is over it, or while it holds text
  you typed, and goes back to normal otherwise. Keyboard navigation
  with the arrow keys and Tab is unchanged
- The default source stays Cinemeta, and the source you choose in the
  menu is saved and kept on updates
- The channels loading screen now covers the page with a solid
  background, so the real channel tiles no longer show through the
  loading animation while the list is being prepared
- Updated the notes about which source works on which connection in
  the README and FAQ, and the network badge

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

- Channels now accept any channels file, not only JSON: M3U, M3U8,
  M3U_PLUS, JSON in several layouts, PLS, XSPF and plain text lists
  (name and link per line). The format is detected from the content,
  categories come from group-title or #EXTGRP, logos from tvg-logo,
  and user agent, referer and clear key options from the file are kept.
  Entries with the same name and category are merged into one channel
  with several servers

- The skip button now reacts to the mouse: it gets lighter while the
  pointer is over it and returns to normal as soon as the pointer
  leaves the button or the window
- The file info page (I) no longer shows the playback link or the
  subtitle link: mpv's built-in statistics page, which printed them
  with their keys, is turned off, and the safe info page is always
  available
- Builds now run on your own computer instead of GitHub Actions: one
  command, ./go.sh, builds the Linux executable, builds the Windows
  one with Wine, bundles bash and mpv for Windows, publishes the
  release and updates this machine. It no longer depends on GitHub
  artifact storage

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
