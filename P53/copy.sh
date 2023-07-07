#!/bin/bash

cp ~/.vimrc ~/.xinitrc ~/.tmux.conf ~/Files/Conf/P53
cp ~/.vim/syntax/clojure.vim ~/Files/Conf/P53
cp ~/.config/picom.conf ~/Files/Conf/P53
cp ~/.config/i3/config ~/Files/Conf/P53/i3/
cp ~/.config/i3status/config ~/Files/Conf/P53/i3status/
cp -r ~/Files/Scri ~/Files/Conf/P53/
cp /etc/udev/rules.d/90-backlight.rules ~/Files/Conf/P53
pacman -Qqe > pacman.txt
