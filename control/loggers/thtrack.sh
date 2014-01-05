#!/bin/bash
TEMPTRACK=~/control/tmp/temp
HUMTRACK=~/control/tmp/hum
TEMPSORT=~/control/logs/temps
HUMSORT=~/control/logs/hums
TIME=`~/control/config.sh temp_humidity_seconds_sample`
PIN=`~/control/config.sh sensor pins`
while true; do
 DATA=`sudo ~/control/sensor 22 4 | grep Temp | tr -s ' ' | cut -d ' ' -f 3,7`
 TEMP=`echo $DATA | cut -d ' ' -f 1`
 HUM=`echo $DATA | cut -d ' ' -f 2`
 echo $TEMP >> $TEMPTRACK
 echo $HUM >> $HUMTRACK
 sort -n $TEMPTRACK > $TEMPSORT
 sort -n $HUMTRACK > $HUMSORT
 sleep $TIME
done
exit
