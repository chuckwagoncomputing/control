#!/bin/bash
CTEMP=`~/control/config.sh curtains_open_close_temp`
CON=`~/control/config.sh curtains_yn`
COPIN=`~/control/config.sh curtain_open pins`
CCPIN=`~/control/config.sh curtain_close pins`
MTEMP=`~/control/config.sh mister_onoff_temp`
MON=`~/control/config.sh misters_yn`
MPIN=`~/control/config.sh misters pins`
FTEMP=`~/control/config.sh cool_fans_onoff_temp`
FON=`~/control/config.sh cool_fans_yn`
FPIN=`~/control/config.sh cool_fans pins`
HTEMP=`~/control/config.sh heater_onoff_temp`
HON=`~/control/config.sh heaters_yn`
HPIN=`~/control/config.sh heaters pins`
while true; do
 CURTEMP=`tail -n 1 ~/control/tmp/temp | cut -d '.' -f 1`
 if [ $CON = "y" ]; then
  if [ $CURTEMP -ge $CTEMP ]; then
   sudo ~/control/toggle.sh $CCPIN high
   sudo ~/control/toggle.sh $COPIN low
  elif [ $CURTEMP -lt $CTEMP ]; then
   sudo ~/control/toggle.sh $COPIN high
   sudo ~/control/toggle.sh $CCPIN low
  else
   echo "Error #1"
  fi
 fi
 if [ $MON = "y" ]; then
  if [ $CURTEMP -ge $MTEMP ]; then
   sudo ~/control/toggle.sh $MPIN low
  elif [ $CURTEMP -lt $MTEMP ]; then
   sudo ~/control/toggle.sh $MPIN high
  else
   echo "Error #2"
  fi
 fi
 if [ $FON = "y" ]; then
  if [ $CURTEMP -ge $FTEMP ]; then
   sudo ~/control/toggle.sh $FPIN low
  elif [ $CURTEMP -lt $FTEMP ]; then
   sudo ~/control/toggle.sh $FPIN high
  else
   echo "Error #3"
  fi
 fi
 if [ $HON = "y" ]; then
  if [ $CURTEMP -lt $HTEMP ]; then
   sudo ~/control/toggle.sh $HPIN low
  elif [ $CURTEMP -ge $HTEMP ]; then
   sudo ~/control/toggle.sh $HPIN high
  else
   echo "Error #4"
  fi
 fi
done
exit
