#!/bin/sh

snippet=$(rofi -dmenu -i -p "Bookmarks" -input $HOME/gohan/scripts/snippets.txt | cut -d' ' -f1)
xdotool type --clearmodifiers "${snippet}"
