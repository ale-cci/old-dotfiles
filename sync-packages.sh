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
	subversion\
	rsync\
	tmux\
	xclip\
	xf86-input-libinput\
	xorg-server\
	xf86-video-intel\
	xorg-xinit\
	xorg-xbacklight\
	neofetch\
	xcompmgr\
	xorg-setxkbmap\
	zathura\
	vifm\
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

# Image Viewer
aur_install "sxiv-git"

# for Vifm Image Preview
aur_install "python-pillow-simd"
aur_install "python-ueberzug"


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
https://github.com/dylanaraps/neofetch

# Powerline fonts instsllation
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
mv fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
./install.sh
cd ..
rm -rf fonts

# Nerd Font installation
snv export https://github.com/ryanoasis/nerd-fonts/trunk/patched-fonts/FiraCode FiraCode
mkdir -p ~/.local/share/fonts

mv FiraCode  ~/.local/share/fonts

