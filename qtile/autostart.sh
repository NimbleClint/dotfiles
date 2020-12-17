#!/bin/sh

~/.config/wpg/wpg_init.sh &
~/.config/wpg/setWallpaper.sh &
picom --config="$HOME/.config/picom/picom.conf" &
dunst &
numlockx on

