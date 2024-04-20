#mplayer -loop 0 -rootwin -ao null -noconsolecontrols -fs \
#  /home/de/Files/xMisc/Wallpaper/rose.mp4 &
feh --bg-scale Files/xMisc/Wallpaper/purple.png &
xset s off -doms & # monitor power saving
setxkbmap -layout de -option caps:escape &
gnome-keyring-daemon --start & 
redshift -l 51.0504:13.7373 &
telegram-desktop -startintray &
birdtray &
orage &
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --alpha 0 --tint 0x1d1f21 \
 --height 19 &
compton --config /home/de/.config/compton.conf -b &
xsetroot -cursor_name left_ptr &
exec xmonad
#exec i3
