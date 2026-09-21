# Licenses

Components shipped in the **Windows 7 Enhanced** pack. The repository is an
**aggregation** of separately-licensed works: project files are CC BY-NC-SA,
the forked Aero components are GPL.

## Project components — CC BY-NC-SA 4.0

Licensed under **CC BY-NC-SA 4.0**
(<https://creativecommons.org/licenses/by-nc-sa/4.0/>), the same terms as the
original icon theme. See `COPYING`.

| Component | Path | Author |
|-----------|------|--------|
| Icon theme | `icons/windows-7-enhanced/` | Blackcrack / Blackysgate.de (original) |
| Global theme | `look-and-feel/windows-7-enhanced/` | Leon Khoo |
| Color scheme | `color-schemes/Windows7Enhanced.colors` | Leon Khoo |

> **Note on "open":** CC BY-NC-SA is an open *content* license, but the
> **NonCommercial** clause means it is **not** OSI-approved open source.

### Notes on the icon theme

* Original work: *Plasma SVG Win7 Theme* by Blackcrack (Blackysgate.de).
* **Third-party artwork inside the icon theme** keeps its own copyright, e.g.
  weather applet icons from `deviantart.com/jackseller` and vendor/application
  logos. These are **not** relicensed by this pack.

## Forked Aero components — GPL-3.0-or-later

These are forks of third-party works, renamed into the `windows-7-enhanced`
namespace and adapted. They keep their **GPL** license and attribute the
original authors. Full GPL text: [`LICENSES/GPL-3.0.txt`](LICENSES/GPL-3.0.txt).

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

## Not bundled

| Component | Note |
|-----------|------|
| Kvantum engine | Required for `widgetStyle=kvantum`; install the `kvantum` package (GPL-3.0-or-later). |

## Deliberately excluded (unclear / non-open license)

| Item | Reason |
|------|--------|
| `Win7Bulid-cursors` cursor theme | No license file; derived from the proprietary Windows 7 cursor set |
| Original wallpapers (`1920x1080-Grungy.jpg`, `1920x1080-salmanarif.jpg`, `lockscreenorso.jpg`) | Origin/license unknown — kept in `_backup/original-assets/` (gitignored) |
