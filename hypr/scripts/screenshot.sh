#!/usr/bin/bash
now="$(date +'%d.%m.%Y-%H:%M')"
kitty
grimblast --cursor --freeze copysave area ~/Pictures/Screenshot_$now.png
