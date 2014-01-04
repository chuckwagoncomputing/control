#!/bin/bash
TIME=`~/control/config.sh vent_fans_time_minutes_onoff`
ON=`~/control/config.sh vent_fans_yn`
VPIN=`~/control/config.sh vent_fans pins`
if [ $ON = "y" ]; then
 while true; do
  sudo ~/control/toggle.sh $VPIN low
  sleep $TIME\m
  sudo ~/control/toggle.sh $VPIN high
  sleep $TIME\m
 done
fi
exit
