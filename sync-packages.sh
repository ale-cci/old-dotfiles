#!/bin/bash

function aur_install {
	(cd /tmp && curl -L -O "https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz")
	tar -xzf "/tmp/$1.tar.gz" -C /tmp
	(cd /tmp/$1 && yes | makepkg -si)
}

# sudo pacman -Syu
set -e

INPUT=packages.csv
[ ! -f $INPUT ] && echo "File not found" && exit 1
PREV_FS=$IFS
IFS=,

# sudo pacman --noconfirm -p
while read repo name description
do
	echo "$(echo $repo | sed 's/^P/Pac/;s/^A/Aur/') $name: $description";
	case $repo in
		P)
			# Pacman installation
			sudo pacman --noconfirm --needed -S $name > /dev/null 2>&1
			;;
		A)
			# Aur installation
			aur_install "$name" > /dev/null 2>&1
			;;
	esac
done < $INPUT

IFS=$PREV_FS


./oh-my-zsh_install.sh
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

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
function font_installation() {
	svn export https://github.com/ryanoasis/nerd-fonts/trunk/patched-fonts/$1 $1
	mkdir -p ~/.local/share/fonts

	mv $1  ~/.local/share/fonts
}

font_installation FiraCode
font_installation FiraMono
