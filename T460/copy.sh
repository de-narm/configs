#!/bin/bash

cp ~/.vimrc ~/.xinitrc ~/.tmux.conf ~/Files/Configs/T460
cp ~/.vim/syntax/clojure.vim ~/Files/Configs/T460
cp ~/../../etc/X11/xorg.conf ~/Files/Configs/T460
cp ~/.config/compton.conf ~/COMMANDS.td ~/Files/Configs/T460
cp ~/.config/xmonad/xmonad.hs ~/Files/Configs/T460/xmonad/
cp ~/.config/xmobar/config ~/Files/Configs/T460/xmobar/
cp ~/.config/i3/config ~/Files/Configs/T460/i3/
cp ~/.config/i3status/config ~/Files/Configs/T460/i3status/
pacman -Qqe > pacman.txt
