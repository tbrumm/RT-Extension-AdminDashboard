# RT-Extension-AdminDashboard

Replaces the default RT Administration page (`/Admin/`) with a live statistics
dashboard. The bestpractical.com news iframe is gone; in its place you get a
full-width overview of your RT instance — ticket counts, user stats, and all
admin navigation items as icon cards.

![RT Administration Dashboard](docs/screenshot.png)

## Features

- **Ticket stat cards** — Gesamt / Neu / Aktiv / Gelöst / Gelöscht with
  animated counter on page load
- **User info card** — Privilegierte, Unprivilegierte and deaktivierte Benutzer
  with proportional progress bars
- **Configuration info card** — active vs. total Queues and Custom Fields,
  plus group count
- **Admin menu grid** — every admin menu item as an icon card (4 columns,
  responsive), including items added by other plugins; hover lifts the card
- **Theme-aware** — uses Bootstrap 5 `var(--bs-*)` variables; works with Nord,
  Dark Mode, KNTheme and any other RT theme out of the box
- **No external dependencies** — Bootstrap Icons and Bootstrap 5 are already
  bundled with RT 6; no CDN calls

## Requirements

- Request Tracker 5.0.0 or later (developed and tested on RT 6)

## Installation

```bash
perl Makefile.PL
make
sudo make install
```

Clear the Mason cache and restart Apache:

```bash
sudo rm -rf /opt/rt6/var/mason_data/obj/*
sudo service apache2 restart
```

## Plugin Registration

Add to `/opt/rt6/etc/RT_SiteConfig.d/002_Plugins.pm` (or your site config):

```perl
Plugin('RT::Extension::AdminDashboard');
```

No further configuration needed. `ShowRTPortal` is no longer relevant — the
extension overrides the entire admin page layout.

## How it works

The extension overrides two Mason templates:

| Template | Purpose |
|---|---|
| `html/Admin/index.html` | Full admin page replacement — stat cards, info cards, menu grid |
| `html/Admin/Elements/Portal` | Widget-only fallback (not used by the new index) |

All statistics are fetched via direct SQL on `$RT::Handle->dbh` to avoid
RT's ORM query timeout (`$DatabaseQueryTimeout`). The menu items are read
from RT's own menu tree after `BuildMainMenu => 1` has populated it, so any
admin items registered by other plugins appear automatically.

## Author

Torsten Brumm

## License

GNU General Public License v2
