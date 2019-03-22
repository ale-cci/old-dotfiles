#!/bin/sh

#
#        _    _       ____           ___           _        _ _
#       / \  | | ___ / ___|         |_ _|_ __  ___| |_ __ _| | | ___ _ __
#      / _ \ | |/ _ \ |      _____   | || '_ \/ __| __/ _` | | |/ _ \ '__|
#     / ___ \| |  __/ |___  |_____|  | || | | \__ \ || (_| | | |  __/ |
#    /_/   \_\_|\___|\____|         |___|_| |_|___/\__\__,_|_|_|\___|_|
#


function sync_dirs() {
	# Desktop Folder
	mkdir -p ~/desk
	mkdir -p ~/.scripts

	# Download Folder
	mkdir -p ~/dl

	# Config Directories
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/i3blocks
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/fontconfig/conf.d
}

function g_config() {
	# Configure Github account
	echo -n "Do you have a git account [Y/n]: " && read configure

	if [[ "$configure" =~ ^[Yy].* ]]; then

		# Config Github Username and email

		echo -n "Your github username: " && read git_username
		echo -n "Your github email: " && read git_email
		git config --global user.name $git_username
		git config --global user.email $git_email


		echo "Git Username: $git_username"
		echo "Git Email: $git_email"
		echo "Added default username and email"
	fi
}



### Start of the Script

set -e
# Use all cores for compilation.
sudo sed -i "s/-j2/-j$(nproc)/;s/^#MAKEFLAGS/MAKEFLAGS/" /etc/makepkg.conf
# Make pacman and yay colorful and adds eye candy on the progress bar because why not.
grep "^Color" /etc/pacman.conf >/dev/null || sudo sed -i "s/^#Color/Color/" /etc/pacman.conf
grep "ILoveCandy" /etc/pacman.conf >/dev/null || sudo sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
# Download Dependencies
sync_dirs
./sync-packages.sh
./sync-symlinks.sh

# Sets zsh as the default shell
[[ $SHELL != "$(which zsh)" ]] && chsh -s $(which zsh)


# Vim Configuration
# Installing Vundle
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Installing vim plugins
nvim -E -c "PlugUpdate|visual|q|q"

systemctl --user enable redshift
systemctl --user enable mpd

# Setting Wallpaper
cp wall.png ~/.config
git config --global merge.tool vimdiff

[ $(echo "$SHELL" | grep zsh) ] && g_config
echo "Installation Completed!"
shutdown -r

