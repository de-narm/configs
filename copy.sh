#!/bin/bash

cp ~/.vimrc ~/.xinitrc ~/.tmux.conf ~/Files/Configs 
cp ~/.vim/syntax/clojure.vim ~/Files/Configs
cp ~/.config/i3/config ~/Files/Configs/i3
cp ~/../../etc/X11/xorg.conf ~/.ycm_extra_conf.py ~/Files/Configs
cp ~/.config/compton.conf ~/COMMANDS.td ~/Files/Configs
cp ~/.config/i3/config ~/Files/Configs/i3
cp ~/.config/i3status/config ~/Files/Configs/i3status
pacman -Qqe > pacman.txt
