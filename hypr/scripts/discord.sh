#!/usr/bin/bash
minute="$(date +%M)"
minute=$((10#$minute))
echo $minute
if [[ $minute -ge 54 ]] || [[ $minute -le 6 ]]; then
	vesktop &
else
	kitty -e bash -c 'echo "Not within 5 Minutes of a full hour";  sleep 1'
fi
