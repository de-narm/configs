xrdb -merge ~/.Xresources &
setxkbmap -layout de -option caps:escape &
xset s off &
feh --bg-center /home/de/Files/Conf/P53/purple.png &
picom --config /home/de/.config/picom.conf -b &
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --alpha 0 --tint 0x1d1f21 \
 --height 19 &
birdtray &
orage &
discord --start-minimized &
flameshot &
telegram-desktop --startintray &
xsetroot -cursor_name left_ptr &
exec xmonad
#exec i3
