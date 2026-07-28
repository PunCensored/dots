#!/usr/bin/bash
hour="$(date +%H)"
hour=$((10#$hour))
echo $hour
if [[ $hour -ge 22 ]] || [[ $hour -le 7 ]]; then
	kitty -e bash -c 'echo "Too late. Go to sleep."; sleep 1'
else
	/usr/bin/librewolf &
fi
