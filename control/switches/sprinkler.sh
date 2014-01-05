#!/bin/bash
SPIN=`~/control/config.sh sprinkler pins`
echo "Enter 1 for on, 0 for off"
read -n1 ENT
echo
if [ $ENT = "1" ]
then
sudo ~/control/toggle.sh $SPIN low
elif [ $ENT = "0" ]
then
sudo ~/control/toggle.sh $SPIN high
else
echo "Must enter either 1 or 0"
fi
exit
