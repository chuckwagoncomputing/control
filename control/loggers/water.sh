#!/bin/bash
WFILE=~/control/logs/water.log
WNOW=`cat ~/control/tmp/water`
WTHEN`tail -2 $WFILE | head -n 1`
USED=$(( WNOW - WTHEN ))
DATE=`date +%D`
echo $WNOW >> $WFILE
echo -n "Used on $DATE: " >> $WFILE
echo $USED >> $WFILE
echo "Water used: $USED"
echo "Saved to $WFILE"
exit
