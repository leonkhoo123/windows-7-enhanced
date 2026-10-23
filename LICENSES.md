# Licenses

The **theme components** in this repository are **GPL-3.0-or-later**. The
bundled **start-menu plasmoid** is **AGPL-3.0-or-later** (see
[Bundled start menu](#bundled-start-menu--agpl-30-or-later) below).

The GPL text is in [`LICENSES/GPL-3.0.txt`](LICENSES/GPL-3.0.txt); the AGPL text
is in [`LICENSES/AGPL-3.0.txt`](LICENSES/AGPL-3.0.txt) and in the plasmoid's own
[`LICENSE`](plasmoids/Windows7StartMenu4KDE/LICENSE).

## Project additions — GPL-3.0-or-later

| Component | Path | Author |
|-----------|------|--------|
| Global theme (look-and-feel) | `look-and-feel/windows-7-enhanced/` | Leon Khoo |
| Color scheme | `color-schemes/Windows7Enhanced.colors` | Leon Khoo |
| Installer + docs | `install.sh`, `README.md`, `LICENSES.md`, `AUTHORS` | Leon Khoo |

## Forked Aero components — GPL-3.0-or-later

Forks of third-party works, renamed into the `windows-7-enhanced` namespace and
adapted. They keep the **GPL** license and credit the original authors.

| Component | Path | Based on |
|-----------|------|----------|
| Plasma theme | `plasma/desktoptheme/windows-7-enhanced/` | ExposeAir by Mark Whittaker (Phobian347) |
| Window decoration | `aurorae/themes/windows-7-enhanced/` | ExposeAir by Mark Whittaker (Phobian347) |
| Kvantum theme | `kvantum/windows-7-enhanced/` | ExposeAir's Kvantum theme by Mark Whittaker |
| Splash | `look-and-feel/windows-7-enhanced-splash/` | windows7splash by luis-pseudo / AudacityXD62 |
| Aero color scheme | `color-schemes/Windows7EnhancedAero.colors` | ExposeAir by Mark Whittaker |

**Modifications:** renamed package IDs, updated descriptions/metadata, and (for
the splash) removed the proprietary `contents/splash/tahoma.ttf`. Original
authors are credited in each `metadata.json` and in `README.md`.

## Bundled start menu — AGPL-3.0-or-later

| Component | Path | Based on |
|-----------|------|----------|
| Start menu | `plasmoids/Windows7StartMenu4KDE/` | [Windows7StartMenu4KDE](https://github.com/walterdemacedorodrigues/Windows7StartMenu4KDE) by walterdemacedorodrigues |

This plasmoid is a **patched fork** of Windows7StartMenu4KDE 1.3.0. Modifications
(2026-10-23, Leon Khoo): white application pane with black text, transparent
right-hand side panel, white search box, Windows 7 orb by default, and adjusted
default tints/opacity. See
[`plasmoids/Windows7StartMenu4KDE/MODIFICATIONS.md`](plasmoids/Windows7StartMenu4KDE/MODIFICATIONS.md).
The full AGPL text is in
[`LICENSES/AGPL-3.0.txt`](LICENSES/AGPL-3.0.txt) and in the component's
[`LICENSE`](plasmoids/Windows7StartMenu4KDE/LICENSE).

## Not in this repository

| Component | Where | License |
|-----------|-------|---------|
| Icon theme | separate repo `windows-7-enhanced-icons` | CC BY-NC-SA 4.0 (non-commercial) |
| Kvantum engine | your distro's `kvantum` package | GPL-3.0-or-later |
| Windows 7 cursors | not provided (original has no clear open license) | — |
