#!/bin/bash

# Todo set ubuntu font family
# sudo pacman -Syu

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
	xcompmgr\
	xorg-setxkbmap\
	zathura\
	xwallpaper\
	zsh


#=======>   Aur packages    <=======#
function aur_install {
	curl -L -O "https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz"
	mv "$1.tar.gz" /tmp
	tar -xvzf "/tmp/$1.tar.gz" -C /tmp
	(cd /tmp/$1 && yes | makepkg -si > /dev/null)
}

aur_install "sc-im"
aur_install "unclutter-xfixes-git"


#=======> Git dependencies  <=======#
# Installing Suckless terminal and dmenu
function suckless_git_install {
	echo "Installing $2..."
	git clone $1 $2 > /dev/null

	# Tweaks
	case $1 in
		*st.git)
			sed  -i -E 's/pixelsize=[0-9]+/pixelsize=13/g' $HOME/dl/st-source/config.h ;;
	esac

	(cd $2 && sudo make clean install > /dev/null)
}

suckless_git_install "https://github.com/LukeSmithxyz/st.git" "$HOME/dl/st-source"
suckless_git_install "https://github.com/LukeSmithxyz/dmenu.git" "$HOME/dl/dmenu-source"

# Powerline fonts instsllation
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

