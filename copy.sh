#!/bin/bash

cp ~/.vimrc ~/.config/i3/config ~/.xinitrc ~/Files/Configs 
cp ~/../../etc/X11/xorg.conf ~/.ycm_extra_conf.py ~/Files/Configs
cp ~/.tmux.conf ~/../../../etc/i3status.conf ~/Files/Configs
cp ~/.config/compton.conf ~/COMMANDS.td ~/Files/Configs
pacman -Qqe > pacman.txt
