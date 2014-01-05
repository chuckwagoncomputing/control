#!/bin/bash
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
cfg_parser ~/control/settings.conf

if [ $2 ]; then
 cfg_$2
else
 cfg_main
fi

eval echo `echo "$"$1`
