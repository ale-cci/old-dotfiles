# Download Dependencies
./sync-packages.sh
./sync-dirs.sh


# Sets zsh as the default shelL
[[ $SHELL != "$(which zsh)" ]] && chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Installing ZSH theme
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

#Init Vundle
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



# Creating Symlinks
ln -sfn $PWD/.Xresources ~/.Xresources
ln -sfn $PWD/.zshrc ~/.zshrc
ln -sfn $PWD/.zshenv ~/.zshenv

mkdir -p ~/.config/nvim
ln -sfn $PWD/init.vim  ~/.config/nvim/init.vim

#Installing ST terminal (patched by Luke Smith)
ST_DIR="$HOME/dl/st-terminal"
git clone https://github.com/LukeSmithxyz/st.git "$ST_DIR"
( cd $ST_DIR && sudo make clean install)
