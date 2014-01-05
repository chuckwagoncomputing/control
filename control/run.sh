#!/bin/bash
~/control/loggers/thtrack.sh &
sleep 1
~/control/switches/climatectl.sh &
~/control/switches/feed.sh &
~/control/switches/vent.sh &
python ~/control/water.py &
while true; do
 ~/control/loggers/thlog.sh
 ~/control/loggers/water.sh
 sleep 1d
done
