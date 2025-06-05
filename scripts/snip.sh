#!/bin/sh

snippet=$(rofi -dmenu -p "Bookmarks" -input $HOME/gohan/scripts/snippets.txt | cut -d' ' -f1)
xdotool type --clearmodifiers "${snippet}"
