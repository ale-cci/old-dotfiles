#!/bin/sh
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

set -e
# Use all cores for compilation.
sudo sed -i "s/-j2/-j$(nproc)/;s/^#MAKEFLAGS/MAKEFLAGS/" /etc/makepkg.conf
# Make pacman and yay colorful and adds eye candy on the progress bar because why not.
grep "^Color" /etc/pacman.conf >/dev/null || sudo sed -i "s/^#Color/Color/" /etc/pacman.conf
grep "ILoveCandy" /etc/pacman.conf >/dev/null || sudo sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
# Download Dependencies
./sync-dirs.sh
./sync-packages.sh
./sync-symlinks.sh

# Sets zsh as the default shell
[[ $SHELL != "$(which zsh)" ]] && chsh -s $(which zsh)


# Vim Configuration
# Installing Vundle
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Installing vim plugins
nvim +PlugInstall +qall

systemctl --user enable redshift
sudo systemctl enable mpd

# Setting Wallpaper
cp wall.png ~/.config
git config --global merge.tool vimdiff

[ $(echo "$SHELL" | grep zsh) ] && g_config
echo "Installation Completed!"
shutdown -r

