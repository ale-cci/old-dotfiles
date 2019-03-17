#!/bin/bash

ln -sfn $PWD/.Xresources ~/.Xresources
ln -sfn $PWD/.zshrc ~/.zshrc
ln -sfn $PWD/.zshenv ~/.zshenv
ln -sfn $PWD/.zprofile ~/.zprofile
ln -snf $PWD/.scripts ~
ln -snf $PWD/.xinitrc ~/.xinitrc
ln -snf $PWD/i3-config ~/.config/i3/config
ln -snf $PWD/i3blocks-config ~/.config/i3blocks/config

ln -sfn $PWD/init.vim  ~/.config/nvim/init.vim
ln -sfn $PWD/fontconfig ~/.config

ln -sfn $PWD/vifm ~/.config
