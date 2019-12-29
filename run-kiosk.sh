#!/bin/bash
#-----------------------------------------------------------------------------
# Script to execute the Kiosk
#
#
# Updated on Dec 16, 2019 by Eugene Taylashev
#-----------------------------------------------------------------------------

#===== Set default vars and config params
#-- Base dir
DIR_BASE=/etc/kiosk
#-- File with URL
FILE_URL=${DIR_BASE}/url-kiosk.txt
#-- Default URL
CURR_URL=https://news.google.com/
#-- Browser command
RUN_BROWSER='chromium-browser --kiosk --disable-restore-session-state'

#-- Check input params for URL file name
if [[ $# -ge 1 ]] ; then
  FILE_URL=$1
fi

#-- Check and Parse the URL file
if [ -s ${FILE_URL} ]; then
	CURR_URL=`cat ${FILE_URL}`
fi

#-- Run the browser
exec ${RUN_BROWSER} ${CURR_URL} 1>>/dev/null 2>>/dev/null &

#-- We done
exit 0
