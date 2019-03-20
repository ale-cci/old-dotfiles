#!/bin/sh

set -e
# Use all cores for compilation.
sed -i "s/-j2/-j$(nproc)/;s/^#MAKEFLAGS/MAKEFLAGS/" /etc/makepkg.conf
# Make pacman and yay colorful and adds eye candy on the progress bar because why not.
grep "^Color" /etc/pacman.conf >/dev/null || sed -i "s/^#Color/Color/" /etc/pacman.conf
grep "ILoveCandy" /etc/pacman.conf >/dev/null || sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
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


