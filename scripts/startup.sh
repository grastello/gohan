#!/bin/sh

# Caps lock to Ctrl and adjustments for our small keyboard.
setxkbmap -option ctrl:nocaps -option compose:menu
xmodmap $HOME/gohan/scripts/xmodmap

# No X bells.
xset b off
