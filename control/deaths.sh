#!/bin/bash
echo
FILE=~/control/logs/deaths.log
date +%D >> $FILE
REASONS="sc rs in ji do gr br sr sd ng ot"
sc='scrotal rupture'
rs='respiratory'
in='injury'
ji='joint infection'
do='downer'
gr='greasy'
br='belly rupture'
sr='scrotal rupture'
sd='sudden death'
ng='no growth'
ot='other'
read -p "How many deaths? " NUM
echo "You will be asked to enter a reason $NUM times."
for i in $REASONS; do
 echo -n "$i = "
 eval echo `echo "$"$i`
done
for i in $(seq $NUM); do
 read -p "? " REASON
 eval $(echo "$REASON""c")=$(( $(eval echo "$""$REASON""c") + 1 ))
done
for i in $REASONS; do
 if [ $(eval echo "$""$i""c") -gt 0 ] 2>/dev/null; then
  echo $(eval echo $(echo $i))": "$(eval echo "$""$i""c") >> $FILE
 fi
done
echo "Total: $NUM" >> $FILE
exit
