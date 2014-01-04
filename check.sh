#!/bin/bash
echo
FILE=~/control/logs/checklist.log
ITEMS="Feed Water Envronmental/Ventilation Care/Mortality Pit/Flush/Recycle Facilities/Grounds"
date +%D >> $FILE
echo "Enter 1 for satisfactory, 0 for non-satisfactory"
for i in $ITEMS; do
 read -n 1 -p "$i: " ENT
 if [ $ENT = 1 ]; then
  echo "$i: Satisfactory" >> $FILE
 else
  echo "$i: Non-Satisfactory" >> $FILE
 fi
 echo
done
