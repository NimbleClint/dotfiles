#!/bin/sh
./setWallpaper.sh &
picom --config="$HOME/.config/picom/picom.conf" --experimental-backends &
dunst &
numlockx on &
