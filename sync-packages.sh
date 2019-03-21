#!/bin/bash

# Todo set ubuntu font family
# sudo pacman -Syu


#=======> Official packages <=======#
sudo pacman -S \
	android-tools\
	atool\
	calcurse\
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
	npm\
	subversion\
	tmux\
	unrar\
	qutebrowser\
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
	zathura-pdf-poppler\
	zsh

export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
./oh-my-zsh_install.sh

#=======>   Aur packages    <=======#
function aur_install {
	echo "Installing  $1"
	curl -L -O "https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz" > /dev/null
	mv "$1.tar.gz" /tmp
	tar -xzf "/tmp/$1.tar.gz" -C /tmp
	(cd /tmp/$1 && yes | makepkg -si > /dev/null 2>&1)
	echo "Done"
	echo ""
}

aur_install "sc-im"
aur_install "unclutter-xfixes-git"

# Image Viewer
aur_install "sxiv-git"

# for Vifm Image Preview
aur_install "python-pillow-simd"
aur_install "python-ueberzug"

# for mounting android file system
aur_install "simple-mtpfs"

# Font fallback
# aur_install "ttf-symbola"

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

	(cd $2 && sudo make clean install > /dev/null 2>&1)
}

suckless_git_install "https://github.com/LukeSmithxyz/st.git" "$HOME/dl/st-source"
suckless_git_install "https://github.com/LukeSmithxyz/dmenu.git" "$HOME/dl/dmenu-source"


git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Installing oh-my-my.zsh theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


# Nerd Font installation
svn export https://github.com/ryanoasis/nerd-fonts/trunk/patched-fonts/FiraCode FiraCode
mkdir -p ~/.local/share/fonts

mv FiraCode  ~/.local/share/fonts

