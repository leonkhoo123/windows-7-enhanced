# Windows 7 Enhanced

A KDE Plasma theme pack that brings a Windows 7 look to Linux: an Aero color
scheme, a Plasma global theme, and forked Aero components (Plasma theme,
window decoration, splash, Kvantum theme). **All GPL-3.0-or-later.**

> The **Windows 7 icon theme** is a **separate package** with a
> non-commercial license (CC BY-NC-SA). It lives in its own repo —
> **`windows-7-enhanced-icons`** — and is not bundled here. Install it
> alongside this pack if you want the icons.

## Components

| Component | Path | License |
|-----------|------|---------|
| Global theme (look-and-feel) | `look-and-feel/windows-7-enhanced/` | GPL-3.0-or-later |
| Color scheme | `color-schemes/Windows7Enhanced.colors` | GPL-3.0-or-later |
| Plasma theme *(fork of ExposeAir)* | `plasma/desktoptheme/windows-7-enhanced/` | GPL-3.0-or-later |
| Window decoration *(fork of ExposeAir)* | `aurorae/themes/windows-7-enhanced/` | GPL-3.0-or-later |
| Splash *(fork of windows7splash)* | `look-and-feel/windows-7-enhanced-splash/` | GPL-3.0-or-later |
| Kvantum theme *(fork of ExposeAir)* | `kvantum/windows-7-enhanced/` | GPL-3.0-or-later |
| Aero color scheme *(fork of ExposeAir)* | `color-schemes/Windows7EnhancedAero.colors` | GPL-3.0-or-later |

See [`LICENSES.md`](LICENSES.md) for the full audit.

## Install

```bash
./install.sh              # install or update the Plasma components
./install.sh --apply      # install, then apply the global theme now
./install.sh --uninstall  # remove them
```

Nothing is hardcoded to a user: everything goes under `$XDG_DATA_HOME` /
`$XDG_CONFIG_HOME` (defaults `~/.local/share` and `~/.config`). Then choose
**System Settings → Appearance → Global Theme → Windows 7 Enhanced**.

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

## Credits

* **ExposeAir** — Plasma theme, window decoration, Kvantum theme and color
  scheme by **Mark Whittaker (Phobian347)**, <https://www.pling.com/u/phob1an/>
  (GPL) — forked and adapted here
* **windows7splash** — by **luis-pseudo**, original by **AudacityXD62**, GPL —
  forked and adapted here
* Windows 7 Enhanced edition and global theme — **Leon Khoo**
* Icon theme (separate repo) — **Blackcrack / Blackysgate.de** (CC BY-NC-SA)

## License

**GPL-3.0-or-later** — see [`COPYING`](COPYING) and the full text in
[`LICENSES/GPL-3.0.txt`](LICENSES/GPL-3.0.txt).
