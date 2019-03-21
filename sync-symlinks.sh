#!/bin/bash

set -e

ln -sfn $PWD/.Xresources ~/.Xresources
ln -sfn $PWD/.zshrc ~/.zshrc
ln -sfn $PWD/.zshenv ~/.zshenv
ln -sfn $PWD/.zprofile ~/.zprofile
rm -rf ~/.scripts
ln -snf $PWD/.scripts ~
ln -snf $PWD/.xinitrc ~/.xinitrc
ln -snf $PWD/i3-config ~/.config/i3/config
ln -snf $PWD/i3blocks-config ~/.config/i3blocks/config

ln -sfn $PWD/init.vim  ~/.config/nvim/init.vim
rm -rf ~/.config/fontconfig
ln -sfn $PWD/fontconfig ~/.config/fontconfig

rm -rf ~/.config/vifm
ln -sfn $PWD/vifm ~/.config
ln -sfn $PWD/dunst ~/.config
ln -sfn $PWD/.tmux.conf ~

ln -snf $PWD/.emoji ~/.config/.emoji

rm -rf ~/.config/qutebrowser
ln -snf $PWD/qutebrowser ~/.config/qutebrowser

echo "Config files linked successfully"
