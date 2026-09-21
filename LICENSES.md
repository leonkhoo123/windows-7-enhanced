# Licenses

Every component shipped in the **Windows 7 Enhanced** pack, with its license
and origin.

The repository is an **aggregation** of separately-licensed works: the project's
own files are CC BY-NC-SA, the bundled ExposeAir and windows7splash themes are
GPL. Each part keeps its own license.

## Project components — CC BY-NC-SA 4.0

Licensed under **CC BY-NC-SA 4.0**
(<https://creativecommons.org/licenses/by-nc-sa/4.0/>), the same terms as the
original icon theme. See `COPYING`.

| Component | Path | Author |
|-----------|------|--------|
| Icon theme | `icons/windows-7-enhanced/` | Blackcrack / Blackysgate.de (original) |
| Color scheme | `color-schemes/Windows7Enhanced.colors` | Leon Khoo |
| Plasma global theme | `look-and-feel/windows-7-enhanced/` | Leon Khoo |

> **Note on "open":** CC BY-NC-SA is an open *content* license, but the
> **NonCommercial** clause means it is **not** OSI-approved open source and not
> "open" under the Open Definition. That is intentional, to match the original.

### Notes on the icon theme

* Original work: *Plasma SVG Win7 Theme* by Blackcrack (Blackysgate.de).
* **Third-party artwork inside the icon theme** keeps its own copyright, e.g.
  weather applet icons from `deviantart.com/jackseller` and various vendor /
  application logos. These are **not** relicensed by this pack.

## Bundled third-party components — GPL

Aggregated with the pack; **not** covered by CC BY-NC-SA. Full details in
[`third-party/NOTICE.md`](third-party/NOTICE.md); GPL text in
[`third-party/GPL-3.0.txt`](third-party/GPL-3.0.txt).

| Component | Path | Author | License |
|-----------|------|--------|---------|
| ExposeAir Plasma theme | `third-party/exposeair/plasma/desktoptheme/exposeair/` | Mark Whittaker | GPL (LICENSE: GPL-3.0) |
| ExposeAir Aurorae decoration | `third-party/exposeair/aurorae/themes/exposeair/` | Mark Whittaker | GPL (LICENSE: GPL-3.0) |
| ExposeAir color scheme | `third-party/exposeair/color-schemes/ExposeAir.colors` | Mark Whittaker | GPL |
| ExposeAir Kvantum theme | `third-party/exposeair/kvantum/ExposeAir/` | Mark Whittaker | GPL |
| Kvantum theme `windows-7-enhanced` | `kvantum/windows-7-enhanced/` | Mark Whittaker (ExposeAir), modified by Leon Khoo | GPL-3.0 (LICENSE file) |
| windows7splash | `third-party/windows7splash/plasma/look-and-feel/windows7splash/` | luis-pseudo / AudacityXD62 | GPL |

**Modification:** `windows7splash`'s `contents/splash/tahoma.ttf` (proprietary
Microsoft font, not referenced by the QML) was removed.

## Not bundled

| Component | Note |
|-----------|------|
| Kvantum engine | Required for `widgetStyle=kvantum`; install the `kvantum` package (GPL-3.0-or-later). Only themes are bundled. |

## Deliberately excluded (unclear / non-open license)

| Item | Reason |
|------|--------|
| `Win7Bulid-cursors` cursor theme | No license file; derived from the proprietary Windows 7 cursor set |
| Original wallpapers (`1920x1080-Grungy.jpg`, `1920x1080-salmanarif.jpg`, `lockscreenorso.jpg`) | Origin/license unknown — kept in `_backup/original-assets/` (gitignored) |
