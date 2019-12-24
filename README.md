Purpose of this repositiry is to document configuration How-Tos and some bash scripts for a basic kiosk with schedules.
Implemented using Raspberry Pi 2 and 3 model B with the Debian Buster desktop.

Usage:
* Dashboards
* Slide shows

Features:
* any URL could be loaded as a fullscreen kiosk in Google Chrome.
* auto-start after reboot, no user interaction
* change content as per the schedule

Files for the kiosk:
* `/etc/kiosk` - main directory
* `run-kiosk.sh` - command to execute the kiosk mode
* `url-kiosk.txt` - URL to use for the kiosk
* `dispatch.sh` - functions to stop/start kiosk with different URLs
* `/etc/cron.d/kiosk` - scheduled activity
