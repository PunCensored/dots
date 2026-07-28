#!/usr/bin/bash
minute="$(date +%M)"
minute=$((10#$minute))
echo $minute
if [[ $minute -ge 50 ]] || [[ $minute -le 10 ]]; then
	/usr/bin/vesktop %U &
else
	kitty -e bash -c 'echo "Not within 10 Minutes of a full hour";  sleep 1'
fi
