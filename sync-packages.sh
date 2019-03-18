#!/bin/bash

# Todo set ubuntu font family
# sudo pacman -Syu

#=======> Official packages <=======#
sudo pacman -S \
	android-tools\
	atool\
	calcurse\
	chromium\
	dunst\
	git\
	htop\
	i3-gaps\
	i3blocks\
	i3status\
	libnotify\
	mpc\
	mpd\
	mpv\
	ncmpcpp\
	ncurses\
	neofetch\
	neovim\
	networkmanager\
	pulseaudio-alsa\
	pulseaudio\
	pulsemixer\
	python\
	rsync\
	subversion\
	tmux\
	unrar\
	unzip\
	vifm\
	xclip\
	xcompmgr\
	xf86-input-libinput\
	xf86-video-intel\
	xorg-server\
	xorg-setxkbmap\
	xorg-xbacklight\
	xorg-xinit\
	xorg-xwininfo\
	xwallpaper\
	zathura\
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

# Font fallback
aur_install "ttf-symbola"

# Redshift
aur_install "redshift-minimal"
aur_install "urlscan"
aur_install "xurls"


#=======> Git dependencies  <=======#
# Installing Suckless terminal and dmenu
function suckless_git_install {
	echo "Installing $2..."
	git clone $1 $2 > /dev/null

	# Tweaks
	case $1 in
		*st.git)
			sed  -i -E 's/pixelsize=[0-9]+/pixelsize=13/g' $2/config.h ;;
		*dmenu.git)
			sed -i -E 's/:size=[0-9]+/:pixelsize=14/g' $2/config.h ;;
	esac

	(cd $2 && sudo make clean install > /dev/null)
}

suckless_git_install "https://github.com/LukeSmithxyz/st.git" "$HOME/dl/st-source"
suckless_git_install "https://github.com/LukeSmithxyz/dmenu.git" "$HOME/dl/dmenu-source"
https://github.com/dylanaraps/neofetch

# # Powerline fonts instsllation
# git clone https://github.com/powerline/fonts.git --depth=1
# cd fonts
# mv fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
# ./install.sh
# cd ..
# rm -rf fonts

# Nerd Font installation
svn export https://github.com/ryanoasis/nerd-fonts/trunk/patched-fonts/FiraMono FiraMono
mkdir -p ~/.local/share/fonts

mv FiraCode  ~/.local/share/fonts

