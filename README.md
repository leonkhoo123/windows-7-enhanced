# Windows 7 Enhanced

A self-contained KDE Plasma theme pack that brings a Windows 7 look to Linux:
scalable Windows 7 icons, an Aero color scheme and a Plasma global theme.

Enhanced edition by **Leon Khoo**, based on the original
*Plasma SVG Win7 Theme* by **Blackcrack / [Blackysgate.de](https://www.blackysgate.de)**.

## What's included

| Component | Path | License |
|-----------|------|---------|
| Icon theme | `icons/windows-7-enhanced/` | CC BY-NC-SA |
| Color scheme | `color-schemes/Windows7Enhanced.colors` | CC BY-NC-SA |
| Plasma global theme | `look-and-feel/windows-7-enhanced/` | CC BY-NC-SA |

The whole pack is **CC BY-NC-SA** (non-commercial), matching the original icon
theme: [creativecommons.org/licenses/by-nc-sa/4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).
See [`LICENSES.md`](LICENSES.md) for the component list.

## Install

```bash
./install.sh              # install or update the pack
./install.sh --apply      # install, then apply the global theme now
./install.sh --uninstall  # remove the pack
```

Everything goes under `$XDG_DATA_HOME` (default `~/.local/share`) — no username
is hardcoded. Then choose **System Settings → Appearance → Global Theme →
Windows 7 Enhanced**.

## Optional components

The global theme reproduces the layout, icons and colors fully on its own. For
the exact original desktop you can additionally install these **open-licensed**
third-party themes (not bundled here):

* **ExposeAir** — Plasma desktop theme + Aurorae decoration (`exposeair`), GPL
* **Kvantum** — widget style, GPL-3.0-or-later
* **windows7splash** — Windows 7 splash screen, GPL

> The original setup also used a `Win7Bulid-cursors` cursor theme. It has no
> clear open license, so it is **not** referenced by default — see `LICENSES.md`.

## Credits

* Original icon theme: **Blackcrack / Blackysgate.de** (CC BY-NC-SA)
* Enhanced edition, color scheme and global theme: **Leon Khoo**
* The original author's detailed technical notes are preserved in
  [`docs/Readme-original-Blackcrack.md`](docs/Readme-original-Blackcrack.md).
