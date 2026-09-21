# Licenses

Every component shipped in or referenced by the **Windows 7 Enhanced** pack,
with its license and origin.

## Bundled in this repository — all CC BY-NC-SA

The whole pack is distributed under **Creative Commons
Attribution-NonCommercial-ShareAlike (CC BY-NC-SA)**, the same terms as the
original icon theme.

| Component | Path | Author | License |
|-----------|------|--------|---------|
| Icon theme | `icons/windows-7-enhanced/` | Blackcrack / Blackysgate.de | CC BY-NC-SA 4.0 |
| Color scheme | `color-schemes/Windows7Enhanced.colors` | Leon Khoo | CC BY-NC-SA 4.0 |
| Plasma global theme | `look-and-feel/windows-7-enhanced/` | Leon Khoo | CC BY-NC-SA 4.0 |

> **Note on "open":** CC BY-NC-SA is an open *content* license, but the
> **NonCommercial** clause means it is **not** OSI-approved open source and not
> "open" under the Open Definition. That is intentional here, to match the
> original theme.

### Notes on the icon theme

* Original work: *Plasma SVG Win7 Theme* by Blackcrack (Blackysgate.de).
  The original `COPYING` states **CC BY-NC-SA**; the author's notes elsewhere
  mention CC0 for his own icons. The stricter `COPYING` terms are treated as
  authoritative and are applied to the whole pack.
* **Third-party artwork inside the icon theme** keeps its own copyright, e.g.
  weather applet icons from `deviantart.com/jackseller` and various vendor /
  application logos (Microsoft, Adobe, Google, …). These are used as
  mime-type/document icons and are **not** relicensed by this pack.

## Referenced by the global theme (not bundled)

These are referenced by name in `contents/defaults`. They are separate packages
and keep their own licenses — installing them does not relicense this pack.

| Component | Used for | License |
|-----------|----------|---------|
| [ExposeAir](https://www.pling.com/u/phob1an/) | Plasma desktop theme + Aurorae decoration (`exposeair`) | GPL |
| [Kvantum](https://github.com/tsujan/Kvantum) | widget style (`widgetStyle=kvantum`) | GPL-3.0-or-later |
| [windows7splash](https://github.com/luis-pseudo/win7splash) | Windows 7 splash screen | GPL |

> `windows7splash` bundles `tahoma.ttf`, a **proprietary Microsoft font**. It is
> a separate package and is not redistributed here; if you install it, be aware
> of that font's license.

## Deliberately removed (unclear / non-open license)

| Item | Reason | Where it went |
|------|--------|---------------|
| `Win7Bulid-cursors` cursor theme | No license file; derived from the proprietary Windows 7 cursor set | Reference removed from `look-and-feel/.../contents/defaults` |
| `1920x1080-Grungy.jpg`, `1920x1080-salmanarif.jpg`, `lockscreenorso.jpg` | Origin/license unknown (original pack extras) | Moved to `_backup/original-assets/` (gitignored) |
