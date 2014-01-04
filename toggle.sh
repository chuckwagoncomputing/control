#!/bin/bash
PINS=" 2 3 4 7 8 9 10 11 14 15 17 18 22 23 24 25 27 "
if echo "$PINS" | grep " $1 " >> /dev/null; then
 if ls /sys/class/gpio/gpio$1 >>/dev/null; then
  :
 else
  echo $1 > /sys/class/gpio/export
 fi
 if [ "$2" == "high" ]; then
  echo "in" > /sys/class/gpio/gpio$1/direction
 elif [ "$2" == "low" ]; then
  echo "out" > /sys/class/gpio/gpio$1/direction
 else
  echo "Usage: toggle.sh <pin> [high|low]"
 fi
else
 echo "Pin $1 not provided. Provided pins are:$PINS"
fi
