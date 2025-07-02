#mplayer -loop 0 -rootwin -ao null -noconsolecontrols -fs \
#  /home/de/Files/xMisc/Wallpaper/rose.mp4 &
feh --bg-scale Files/xMisc/Wallpaper/alena-aenami-dreamy-1k.jpg &
#xset s off -doms & # monitor power saving
setxkbmap -layout de -option caps:escape &
gnome-keyring-daemon --start & 
redshift -l 51.0504:13.7373 &
Telegram -startintray &
birdtray &
orage &
#trayer --edge top --align right --SetDockType true --SetPartialStrut true \
# --expand true --width 10 --transparent true --alpha 0 --tint 0x1d1f21 \
# --height 19 &
picom --config /home/de/.config/picom.conf -b &
xsetroot -cursor_name left_ptr &
fcitx &
#exec xmonad
exec i3
