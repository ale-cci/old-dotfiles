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
