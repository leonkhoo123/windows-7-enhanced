# Windows 7 Enhanced

A KDE Plasma theme pack that brings a Windows 7 look to Linux: an Aero color
scheme, a Plasma global theme, forked Aero components (Plasma theme, window
decoration, splash, Kvantum theme), and a patched Windows 7 start menu.

> The **Windows 7 icon theme** is a **separate package** and is not bundled
> here. It lives in its own repo —
> [**`windows-7-enhanced-icons`**](https://github.com/leonkhoo123/windows-7-enhanced-icons)
> — install it alongside this pack if you want the icons.

## Install

```bash
./install.sh              # install or update the Plasma components
./install.sh --apply      # install, then apply the global theme and panel layout
./install.sh --uninstall  # remove them
```

Nothing is hardcoded to a user: everything goes under `$XDG_DATA_HOME` /
`$XDG_CONFIG_HOME` (defaults `~/.local/share` and `~/.config`). Then choose
**System Settings → Appearance → Global Theme → Windows 7 Enhanced**.

> `--apply` applies the bundled panel layout too. On an existing customised
> panel this can replace panel contents, so back it up or add the start menu
> manually instead.

## Start menu

The pack bundles a patched fork of
[**Windows7StartMenu4KDE**](https://github.com/walterdemacedorodrigues/Windows7StartMenu4KDE)
as **Windows 7 Start Menu (Enhanced)**. The default layout uses it instead of
Kickoff:

- white applications pane with black text
- transparent glass right-hand pane (the desktop shows through the Aero glass)
- Windows 7 orb, white search box, All Programs
- separate opacity/tint controls for the menu, application list and side panel

Right-click the menu → **Configure Windows 7 Start Menu (Enhanced)** to adjust
the appearance. If you already have a panel you want to keep, add the widget
from **Add Widgets** or replace the existing launcher manually.

The start menu is **AGPL-3.0-or-later**, unlike the GPL theme components. See
[`plasmoids/Windows7StartMenu4KDE/MODIFICATIONS.md`](plasmoids/Windows7StartMenu4KDE/MODIFICATIONS.md)
and its [`LICENSE`](plasmoids/Windows7StartMenu4KDE/LICENSE).

## Icons (separate repo)

The global theme selects the **`windows-7-enhanced`** icon theme if present.
Install it from the companion repo:

```bash
git clone https://github.com/leonkhoo123/windows-7-enhanced-icons
cd windows-7-enhanced-icons && ./install.sh
```

*(that icon pack is CC BY-NC-SA — non-commercial.)*

## Kvantum engine (install separately)

The pack sets `widgetStyle=kvantum`, which needs the **Kvantum engine** (an
application, not a theme, so it is not bundled):

| Distro | Command |
|--------|---------|
| Arch Linux | `sudo pacman -S kvantum` |
| Fedora | `sudo dnf install kvantum` |
| Ubuntu / Debian | `sudo apt install kvantum-manager` |
| openSUSE Tumbleweed | `sudo zypper install kvantum-manager kvantum-qt6` |

Then in **Kvantum Manager**, select the **`windows-7-enhanced`** theme.

## Components

The theme components are **GPL-3.0-or-later**. The bundled start-menu plasmoid
is **AGPL-3.0-or-later** (see below).

| Component | Path |
|-----------|------|
| Global theme (look-and-feel) | `look-and-feel/windows-7-enhanced/` |
| Color scheme | `color-schemes/Windows7Enhanced.colors` |
| Plasma theme *(fork of ExposeAir)* | `plasma/desktoptheme/windows-7-enhanced/` |
| Start menu *(fork of Windows7StartMenu4KDE, AGPL)* | `plasmoids/Windows7StartMenu4KDE/` |
| Window decoration *(fork of ExposeAir)* | `aurorae/themes/windows-7-enhanced/` |
| Splash *(fork of windows7splash)* | `look-and-feel/windows-7-enhanced-splash/` |
| Kvantum theme *(fork of ExposeAir)* | `kvantum/windows-7-enhanced/` |
| Aero color scheme *(fork of ExposeAir)* | `color-schemes/Windows7EnhancedAero.colors` |

## Credits

* **ExposeAir** — Plasma theme, window decoration, Kvantum theme and color
  scheme by **Mark Whittaker (Phobian347)**, <https://www.pling.com/u/phob1an/>
  (GPL) — forked and adapted here
* **windows7splash** — by **luis-pseudo**, original by **AudacityXD62**, GPL —
  forked and adapted here
* **Windows7StartMenu4KDE** — Windows 7 start-menu plasmoid by
  **walterdemacedorodrigues**, AGPL-3.0-or-later —
  <https://github.com/walterdemacedorodrigues/Windows7StartMenu4KDE> —
  forked and patched here (white applications pane, transparent glass side
  panel, black text, white search box, Windows 7 orb)
* Windows 7 Enhanced edition, global theme and start-menu patch — **Leon Khoo**

## License

The theme components are **GPL-3.0-or-later** — see [`COPYING`](COPYING) and the
full text in [`LICENSES/GPL-3.0.txt`](LICENSES/GPL-3.0.txt).

The bundled start menu is **AGPL-3.0-or-later** — see
[`plasmoids/Windows7StartMenu4KDE/LICENSE`](plasmoids/Windows7StartMenu4KDE/LICENSE)
and [`LICENSES.md`](LICENSES.md) for the full license audit.
