#!/bin/bash
FO=`~/control/config.sh feed_one_start_time_military`
FOS=`~/control/config.sh feed_one_stop_time_military`
FT=`~/control/config.sh feed_two_start_time_military`
FTS=`~/control/config.sh feed_two_stop_time_military`
ON=`~/control/config.sh feed_yn`
FPIN=`~/control/config.sh feed pins`
if [ $ON = "y" ]
then
 while true; do
  TIME=`date +%H%M`
  if [ $TIME -gt $FO -a $TIME -lt $FOS ] || [ $TIME -gt $FT -a $TIME -lt $FTS ]; then
   sudo ~/control/toggle.sh $FPIN low
  elif [ $TIME -gt $FOS -a $TIME -lt $FT ] || [ $TIME -lt $FO ] || [ $TIME -gt $FTS ]; then
   sudo ~/control/toggle.sh $FPIN high
  else
   echo "Error: #5"
  fi
  sleep 10
 done
fi
exit
