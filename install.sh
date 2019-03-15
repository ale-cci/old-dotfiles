# Download Dependencies
./_sync-packages.sh
./_sync-directories.sh


# Creating Symlinks
ln -sn $PWD/.Xresources ~/.Xresources
ln -sn $PWD/.Xresources ~/.zshrc

mkdir -p ~/.config/nvim
ln -sn $PWD/init.vim  ~/.config/nvim/init.vim
