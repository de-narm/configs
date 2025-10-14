xrdb -merge ~/.Xresources &
setxkbmap -layout de -option caps:escape &
xset s off &
bash Files/Scri/scale.sh &
feh --bg-scale /home/de/Files/Conf/P53/landscape.jpg &
picom --config /home/de/.config/picom.conf -b &
#trayer --edge top --align right --SetDockType true --SetPartialStrut true \
# --expand true --width 10 --transparent true --alpha 0 --tint 0x1d1f21 \
# --height 19 &
birdtray &
#orage &
#discord --start-minimized &
flameshot &
Telegram --startintray &
#xsetroot -cursor_name left_ptr &
#exec xmonad
fcitx &
exec i3
