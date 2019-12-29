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

## Installation and Configuration
To install a kiosk perform the following steps:
1. Install a typical [Raspbian desktop](https://www.raspberrypi.org/downloads/raspbian/)
2. Using the Raspberry Configuration tool change default password, enable SSH and VNC as well as select Auto-logon to desktop
3. As the root add the following modifications to the file `/etc/xdg/lxsession/LXDE-pi/autostart`: 
`sudo nano /etc/xdg/lxsession/LXDE-pi/autostart`
```
#-- disable screensaver
@xset s noblank
@xset s off
@xset -dpms
@unclutter -idle 0.1 -root

#-- run browser
/etc/kiosk/run-kiosk.sh
```
4. Create as the root the directory `/etc/kiosk` and copy there at least `run-kiosk.sh` and `url-kiosk.txt`
5. For scheduled activity modify with URLs the file `dispatch.sh` and `/etc/cron.d/kiosk`. Sample configuration is included in this repository.
6. Enjoy!
