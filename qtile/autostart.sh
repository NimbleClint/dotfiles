#!/bin/sh

~/.config/wpg/wp_init.sh &
./autostart.sh &
picom --config="$HOME/.config/picom/picom.conf" &
dunst &
numlockx on

