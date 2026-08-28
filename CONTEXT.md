# QZ Personal Build

A personal fork of QDomyos-Zwift, built for zone-2 training on an Echelon bike with a
Bluetooth heart-rate strap. This glossary exists because several words in this codebase
mean different things depending on which screen you are talking about.

## Language

**Dashboard**:
The main in-app screen showing a grid of metrics.
_Avoid_: home screen, main view

**Tile**:
One metric cell on the **Dashboard**. Each has its own enabled flag, order and colour.
_Avoid_: card, widget, box

**Floating Window**:
The always-on-top strip drawn over other apps, so metrics stay visible while riding.
Comes in two variants selected by a type setting: **Classic** and **Horizontal**.
_Avoid_: overlay, popup, HUD

**Classic**:
The stacked/boxy Floating Window variant. The stock default.

**Horizontal**:
The single-row Floating Window variant, rendering metrics as labelled columns.

**Metric**:
One cell in the **Floating Window**. Distinct from a **Tile**, but not independent —
see Relationships.

**HR Zone**:
A heart-rate band derived from max heart rate. Zones are bounded by four configurable
end-percentages; the band above the last one is the top zone.

**Time in Zone**:
Accumulated seconds spent in an **HR Zone**. Displayed in one of two modes:
- **Individual** — time spent strictly inside that zone
- **Progressive** — time spent in that zone *and every zone above it*
The mode is global, not per-zone, and the displayed name changes with it
("HR Zone 2" vs "HR Zone 2+").
_Avoid_: zone timer, elapsed in zone

**Zone 2**:
The second **HR Zone**. The training target this fork is organised around.
Note the off-by-one: the code indexes zones from 0, so Zone 2 is index 1.

## Relationships

- A **Tile** and its corresponding **Metric** share a single enabled flag. Turning a
  **Metric** off in the Floating Window also turns the matching **Tile** off on the
  Dashboard, and vice versa. They are two surfaces onto one setting.
- **Dashboard** ordering and **Floating Window** ordering are *not* shared: Tiles use a
  per-tile order setting, Metrics use an order baked into the Horizontal template.
- A **Time in Zone** value belongs to exactly one **HR Zone**.
- **Time in Zone** is accumulated by the connected device, not by the Dashboard, so the
  value is live even when its **Tile** is hidden.

## Flagged ambiguities

- "overlay" was used for the **Floating Window**; resolved to Floating Window, matching
  the code.
- "zone 2 time elapsed" was used for **Time in Zone** (Zone 2); "elapsed" elsewhere means
  total workout duration, which is a different **Metric** entirely. Resolved: they are
  distinct, and Time in Zone never means workout duration.
- "P.ZONE" in the Floating Window is a *power* zone, not an **HR Zone**.
