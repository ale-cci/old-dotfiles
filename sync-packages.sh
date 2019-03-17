#!/bin/bash


#=======> Official packages <=======#
sudo pacman -S \
	android-tools\
	chromium\
	unzip\
	unrar\
	networkmanager\
	libnotify\
	dunst\
	i3blocks\
	i3-gaps\
	i3status\
	htop\
	ncurses\
	neovim\
	python\
	pulseaudio\
	pulseaudio-alsa\
	pulsemixer\
	rsync\
	tmux\
	xclip\
	xf86-input-libinput\
	xorg-server\
	xf86-video-intel\
	xorg-xinit\
	xorg-xbacklight\
	xorg-xsetxkbmap\
	xwallpaper\
	zsh



#=======>   Aur packages    <=======#
# sc-im


#=======> Git dependencies  <=======#
# Installing Suckless terminal and dmenu
function suckless_git_install {
	git clone $1 $2
	(cd $2 && sudo make clean install)
}

suckless_git_install "https://github.com/LukeSmithxyz/st.git" "$HOME/dl/st-source"
suckless_git_install "https://github.com/LukeSmithxyz/dmenu.git" "$HOME/dl/dmenu-source"
