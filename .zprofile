#!/bin/sh

# Startx if i3 is not already running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Load keyboard configuration
# sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null

# setxkbmap -option caps:swapescape
