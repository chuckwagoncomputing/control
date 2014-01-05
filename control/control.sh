#!/bin/bash
read -n 1 -p "Enter a letter: d-deaths; m-medication; c-checklist: " ENT
if [ $ENT == "d" ]; then
 ~/control/deaths.sh
elif [ $ENT == "m" ]; then
 ~/control/meds.sh
elif [ $ENT == "c" ]; then
 ~/control/check.sh
else
echo "$ENT is not an option"
fi
