#!/bin/sh
#
# ~/.xinitrc
# Andrew Antle - http://antlechrist.org/

setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp
xsetroot -solid '#111111'
#xsetroot -solid '#222222'
#xsetroot -solid '#273954'
xsetroot -cursor_name left_ptr

alsactl restore -f ~/.asound.state
firefox >~/log/firefox 2>&1 &

#while true; do
#	xsetroot -name "`date '+%a %b %d %F :: %H:%M:%S'`"
#	sleep 1
#done &
#exec dwm >~/log/dwm 2>&1
#exec openbox >~/log/openbox 2>&1
exec xmonad >~/log/xmonad 2>&1
