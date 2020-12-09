#!/bin/sh

~/.config/wpg/wpg_init.sh &
~/.config/wpg/setWallpaper.sh &
picom --config="$HOME/.config/picomi/picom.conf" &
dunst &
#numlockx on

