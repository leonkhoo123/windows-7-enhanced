# Windows 7 Enhanced fork

This directory contains a patched fork of
[**Windows7StartMenu4KDE**](https://github.com/walterdemacedorodrigues/Windows7StartMenu4KDE)
1.3.0 by **walterdemacedorodrigues** (AGPL-3.0-or-later).

## Changes for Windows 7 Enhanced — 2026-10-23

* Default appearance is the Windows 7 two-pane look:
  * white application list panel (`listPanelColor=#ffffff`, `listPanelOpacity=100`)
  * transparent right side panel (`sidePanelOpacity=0`)
  * theme popup/glass frame (`menuFrameOpacity=0`)
* Black text on the white application list, favourites/recents rows,
  "All Programs" list and breadcrumb.
* White search box with black text.
* Windows 7 orb enabled by default (`useWindowsOrb=true`).
* Popup glass made more transparent in the Plasma theme
  (`dialogs/background.svg`, centre opacity `0.55`) so the desktop shows
  through the right-hand glass panel.

The original upstream `README.md` is kept for reference. See `LICENSE` for the
full AGPL-3.0 text. The rest of the Windows 7 Enhanced pack is GPL-3.0-or-later.
