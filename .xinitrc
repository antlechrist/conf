#!/bin/sh
#
# ~/.xinitrc
# Andrew Antle - http://antlechrist.org/

setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp
xsetroot -solid '#222222'
xsetroot -cursor_name left_ptr

firefox >~/log/firefox 2>&1 &

while true; do
	xsetroot -name "`date '+%a %b %d %F :: %H:%M:%S'`"
	sleep 1
done &
exec dwm >~/log/dwm 2>&1
