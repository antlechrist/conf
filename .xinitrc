#
# ~/.xinitrc
#
# Andrew Antle - http://antlechrist.org/
#

setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp
xsetroot -solid '#1a1a1a'
xsetroot -cursor_name left_ptr

#
# 9wm
#
#exec 9wm -term urxvt > ~/l/9wm 2>&1

#
# dwm
#
while true; do
	xsetroot -name "`date '+%a %b %d %F :: %H:%M:%S'`"
	sleep 1
done &
exec dwm > ~/l/dwm 2>&1

#
# ratpoison
#
#exec ratpoison > ~/l/ratpoison 2>&1

#
# rio
#
#exec rio -term 9term

#
# wmii
#
#until wmii; do :; done > ~/l/wmii 2>&1

#
# xmonad
#
#exec xmonad > ~/l/xmonad 2>&1
