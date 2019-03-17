# Download Dependencies
./sync-packages.sh
./sync-dirs.sh

# Sets zsh as the default shell
[[ $SHELL != "$(which zsh)" ]] && chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Installing ZSH theme
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Vim Configuration
# Installing Vundle
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Installing vim plugins
vim +PlugInstall +qall


# Creating Symlinks
ln -sfn $PWD/.Xresources ~/.Xresources
ln -sfn $PWD/.zshrc ~/.zshrc
ln -sfn $PWD/.zshenv ~/.zshenv
ln -sfn $PWD/.zprofile ~/.zprofile
ln -snf $PWD/.scripts ~
ln -snf $PWD/.xinitrc ~/.xinitrc
ln -snf $PWD/i3-config ~/.config/i3/config
ln -snf $PWD/i3blocks-config ~/.config/i3blocks/config

ln -sfn $PWD/init.vim  ~/.config/nvim/init.vim


# Setting Wallpaper
cp wall.png ~/.config
