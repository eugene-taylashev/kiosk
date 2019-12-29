#!/bin/bash 
#------------------------------------------------------------------------------
# Dispatch Kiosk activity
#
# Updated on Dec 16, 2019 by Eugene Taylashev
#------------------------------------------------------------------------------

#-- URLs for services
URL_NEWS='https://www.infosecurity-magazine.com/news/'
URL_BOARD='https://isc.sans.edu/dashboard.html'


#===== Set default vars and config params
#-- Base dir
DIR_BASE=/etc/kiosk
#-- File with URL
FILE_URL=${DIR_BASE}/url-kiosk.txt
RUN_KIOSK=${DIR_BASE}/run-kiosk.sh


#===== Functions
save_url(){   	echo $1 >${FILE_URL}; }
stop_kiosk(){ 	pkill chrom; }
start_kiosk(){	${RUN_KIOSK} 1>>/dev/null 2>>/dev/null; }

kiosk() {
  echo $1 >${FILE_URL}
  /sbin/shutdown -r now
}

#===== Actions
case "$1" in

  #-- prepare news URL
  news)
    kiosk ${URL_NEWS}
    ;;

  #-- show Dashboard
  board)
    kiosk ${URL_BOARD}
    ;;

  #-- shutdown the system
  down)
    /sbin/shutdown -h now
    ;;
  
  #-- reboot the system
  reboot)
    /sbin/shutdown -r now
    ;;
  
  #-- kill chromium session
  stop)
   /usr/bin/pkill chrom
    ;;

  #-- kill X session to show screensaver
  killx)
   /usr/bin/pkill x
    ;;

  #-- show usage
  *)
    echo $"Usage: $0 {down|reboot|stop|killx|news|board}"
    exit 1
esac

exit 0
