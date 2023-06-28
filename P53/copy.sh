#!/bin/bash

cp ~/.vimrc ~/.xinitrc ~/.tmux.conf ~/Files/Configs/P53
cp ~/.vim/syntax/clojure.vim ~/Files/Configs/P53
cp ~/.config/picom.conf ~/Files/Configs/P53
cp ~/.config/i3/config ~/Files/Configs/P53/i3/
cp ~/.config/i3status/config ~/Files/Configs/P53/i3status/
cp /etc/udev/rules.d/90-backlight.rules ~/Files/Configs/P53
pacman -Qqe > pacman.txt
