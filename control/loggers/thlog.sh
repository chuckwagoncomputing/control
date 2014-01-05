#!/bin/bash
TEMPLOG=~/control/logs/temps.log
HUMLOG=~/control/logs/humidity.log
TEMPS=~/control/logs/temps
TEMPH=`tail -1 $TEMPS`
TEMPL=`head -n 1 $TEMPS`
HUMS=~/control/logs/hums
HUMH=`tail -1 $HUMS`
HUML=`head -n 1 $HUML`
DATE=`date +%D`
echo $DATE >> $TEMPLOG
echo "HIGH" >> $TEMPLOG
echo $TEMPH >> $TEMPLOG
echo "LOW" >> $TEMPLOG
echo $TEMPL >> $TEMPLOG
echo $DATE >> $HUMLOG
echo "HIGH" >> $HUMLOG
echo $HUMH >> $HUMLOG
echo "LOW" >> $HUMLOG
echo $HUML >> $HUMLOG
rm $TEMPS
rm $HUMS
exit
