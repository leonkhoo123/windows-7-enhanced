# Windows 7 Enhanced

A self-contained KDE Plasma theme pack that brings a Windows 7 look to Linux:
scalable Windows 7 icons, an Aero color scheme, and a Plasma global theme —
**bundling the third-party themes it depends on**, so it works out of the box.

Enhanced edition by **Leon Khoo**, based on the original
*Plasma SVG Win7 Theme* by **Blackcrack / [Blackysgate.de](https://www.blackysgate.de)**.

## What's included

### Project components — CC BY-NC-SA
| Component | Path | Installs to |
|-----------|------|-------------|
| Icon theme | `icons/windows-7-enhanced/` | `~/.local/share/icons/` |
| Color scheme | `color-schemes/Windows7Enhanced.colors` | `~/.local/share/color-schemes/` |
| Global theme | `look-and-feel/windows-7-enhanced/` | `~/.local/share/plasma/look-and-feel/` |

### Bundled third-party — GPL, see [`third-party/NOTICE.md`](third-party/NOTICE.md)
| Component | Path | Installs to |
|-----------|------|-------------|
| **ExposeAir** Plasma theme | `third-party/exposeair/plasma/desktoptheme/exposeair/` | `~/.local/share/plasma/desktoptheme/exposeair/` |
| **ExposeAir** Aurorae decoration | `third-party/exposeair/aurorae/themes/exposeair/` | `~/.local/share/aurorae/themes/exposeair/` |
| **ExposeAir** color scheme | `third-party/exposeair/color-schemes/ExposeAir.colors` | `~/.local/share/color-schemes/ExposeAir.colors` |
| **ExposeAir** Kvantum theme | `third-party/exposeair/kvantum/ExposeAir/` | `~/.config/Kvantum/ExposeAir/` |
| **windows7splash** splash | `third-party/windows7splash/` | `~/.local/share/plasma/look-and-feel/windows7splash/` |
| **Kvantum** theme `windows-7-enhnaced` (GPL-3.0) | `kvantum/windows-7-enhnaced/` | `~/.config/Kvantum/windows-7-enhnaced/` |

The project files are **CC BY-NC-SA 4.0**
([license](https://creativecommons.org/licenses/by-nc-sa/4.0/)); the bundled
third-party themes stay under their own **GPL** licenses. See
[`LICENSES.md`](LICENSES.md) for the full audit.

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

The pack sets `widgetStyle=kvantum`, which needs the **Kvantum engine**. It is
an application, not a theme, so it is not bundled — install it with your distro:

| Distro | Command |
|--------|---------|
| Arch Linux | `sudo pacman -S kvantum` |
| Fedora | `sudo dnf install kvantum` |
| Ubuntu / Debian | `sudo apt install kvantum-manager` |
| openSUSE Tumbleweed | `sudo zypper install kvantum-manager kvantum-qt6` |

Then in **Kvantum Manager**, select the **`windows-7-enhnaced`** theme
(bundled by this pack into `~/.config/Kvantum/`).

## Notes

- **Windows 7 cursors** are not included: the original `Win7Bulid-cursors` has
  no clear open license. See `LICENSES.md`.
- `windows7splash` was bundled **without** its proprietary `tahoma.ttf`.

## Credits

* Original icon theme: **Blackcrack / Blackysgate.de** (CC BY-NC-SA)
* Enhanced edition, color scheme and global theme: **Leon Khoo**
* Bundled themes: **Mark Whittaker** (ExposeAir), **luis-pseudo** /
  **AudacityXD62** (windows7splash)
* Original author's technical notes: [`docs/Readme-original-Blackcrack.md`](docs/Readme-original-Blackcrack.md)
