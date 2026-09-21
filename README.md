# Windows 7 Enhanced

A self-contained KDE Plasma theme pack that brings a Windows 7 look to Linux:
scalable Windows 7 icons, an Aero color scheme, and a Plasma global theme,
plus forked Aero components (Plasma theme, window decoration, splash).

Enhanced edition by **Leon Khoo**, based on the original
*Plasma SVG Win7 Theme* by **Blackcrack / [Blackysgate.de](https://www.blackysgate.de)**.

## Components

| Component | Path | License |
|-----------|------|---------|
| Icon theme | `icons/windows-7-enhanced/` | CC BY-NC-SA |
| Global theme (look-and-feel) | `look-and-feel/windows-7-enhanced/` | CC BY-NC-SA |
| Color scheme | `color-schemes/Windows7Enhanced.colors` | CC BY-NC-SA |
| Plasma theme *(fork of ExposeAir)* | `plasma/desktoptheme/windows-7-enhanced/` | GPL-3.0-or-later |
| Window decoration *(fork of ExposeAir)* | `aurorae/themes/windows-7-enhanced/` | GPL-3.0-or-later |
| Splash *(fork of windows7splash)* | `look-and-feel/windows-7-enhanced-splash/` | GPL-3.0-or-later |
| Kvantum theme *(fork of ExposeAir)* | `kvantum/windows-7-enhanced/` | GPL-3.0-or-later |
| Aero color scheme *(fork of ExposeAir)* | `color-schemes/Windows7EnhancedAero.colors` | GPL |

See [`LICENSES.md`](LICENSES.md) for the full audit.

## Install

```bash
./install.sh              # install or update the whole pack
./install.sh --apply      # install, then apply the global theme now
./install.sh --uninstall  # remove the pack
```

Nothing is hardcoded to a user: everything goes under `$XDG_DATA_HOME` /
`$XDG_CONFIG_HOME` (defaults `~/.local/share` and `~/.config`). Then choose
**System Settings → Appearance → Global Theme → Windows 7 Enhanced**.

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

## Notes

- **Windows 7 cursors** are not included (the original `Win7Bulid-cursors` has
  no clear open license).
- The splash is bundled **without** the proprietary `tahoma.ttf`.

## Credits

* Original icon theme — **Blackcrack / Blackysgate.de** (CC BY-NC-SA)
* **ExposeAir** — Plasma theme, window decoration, Kvantum theme and color
  scheme by **Mark Whittaker (Phobian347)**, <https://www.pling.com/u/phob1an/>
  (GPL) — forked and adapted here
* **windows7splash** — by **luis-pseudo**, original by **AudacityXD62**, GPL —
  forked and adapted here
* Windows 7 Enhanced edition, global theme and forks — **Leon Khoo**
* Original author's technical notes: [`docs/Readme-original-Blackcrack.md`](docs/Readme-original-Blackcrack.md)
