#!/usr/bin/bash
minute="$(date +%M)"
minute=$((10#$minute))
echo $minute
if [[ $minute -ge 54 ]] || [[ $minute -le 6 ]]; then
	vesktop &
else
	echo "NOT within 5 Minutes of a full hour"
fi
