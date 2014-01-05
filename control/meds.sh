#!/bin/bash
echo
cfg_parser(){
 ini="$(<$1)"
 ini="${ini//[/\[}"
 ini="${ini//]/\]}"
 IFS=$'\n' && ini=( ${ini} )
 ini=( ${ini[*]//;*/} )
 ini=( ${ini[*]/\    =/=} )
 ini=( ${ini[*]/=\   /=} )
 ini=( ${ini[*]/\ =\ /=} )
 ini=( ${ini[*]/#\\[/\}$'\n'cfg_} )
 ini=( ${ini[*]/%\\]/ \(} )
 ini=( ${ini[*]/=/=\( } )
 ini=( ${ini[*]/%/ \)} )
 ini=( ${ini[*]/%\\ \)/ \\} )
 ini=( ${ini[*]/%\( \)/\(\) \{} )
 ini=( ${ini[*]/%\} \)/\}} )
 ini[0]=""
 ini[${#ini[*]} + 1]='}'
 eval "$(echo "${ini[*]}")"
}
cfg_parser ~/control/drugs.list
cfg_drugs

FILE=~/control/logs/meds.log
read -p "Enter number of pigs vaccinated: " NUM
read -p "Enter number of needles used: " NEEDLES
read -p "Enter name of drug: " DRUG
read -n 1 -p "Enter the method (s=sq, i=im, w=water): " METHOD
echo
read -n 2 -p "Enter the first and last initials of person administrating the drug: " INI
echo
read -p "Enter pen numbers: " PEN
date +%D >> $FILE
echo "Pigs Vaccinated: "$NUM >> $FILE
echo "Drug: "$DRUG >> $FILE
echo "Method: "$METHOD >> $FILE
DRUGV=`echo "$DRUG" | tr -d [:blank:] | tr -d [:digit:] | tr -d [:punct:] | tr [:upper:] [:lower:]`
if [ ! $(eval echo $(echo "$""$DRUGV")) == "$METHOD" ]; then
 tput setaf 1
 tput setab 7
 echo "Warning: Drug $DRUG does not match method $METHOD"
 tput sgr0
 echo "Warning: Drug $DRUG does not match method $METHOD" >> $FILE
fi
echo "Needles used: "$NEEDLES >> $FILE
if [ $((NUM / 30)) -gt $NEEDLES ]; then
 tput setaf 1
 tput setab 7
 echo "Warning: not enough needles used!"
 tput sgr0
 echo "Warning: not enough needles used!" >> $FILE
fi
echo "Initials: "$INI >> $FILE
echo "Pens: "$PEN >> $FILE
exit
