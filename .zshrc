#
#  =/ AleC zshell config /=
#


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:$HOME/.local/bin"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
# Which plugins would you like to load?
plugins=( git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export FILE="vu"
# User configuration

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

function aur_install {
	curl -L -O "https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz"
	mv "$1.tar.gz" /tmp
	tar -xvzf "/tmp/$1.tar.gz" -C /tmp
	(cd /tmp/$1 && yes | makepkg -si > /dev/null)
}

# Personal Aliases
alias zshrc="$EDITOR ~/.zshrc"
alias zshenv="$EDITOR ~/.zshenv"
alias zprconfig="$EDITOR ~/.zprofile"
alias i3config="$EDITOR ~/.config/i3/config"
alias i3bconfig="$EDITOR ~/.config/i3blocks/config"
alias mkd="mkdir -pv"
alias nr="npm run"

alias vim="$EDITOR"
alias vimrc="$EDITOR ~/.config/nvim/init.vim"
alias tarx="tar -xvzf"
alias xconfig="$EDITOR ~/.Xresources"

alias cbeifi="cd $BEIFI_DIR"
alias cmob="cd $BEIFI_MOBILE_DIR"
alias capex="cd ~/desk/al_stats"
alias cscripts="cd ~/Desktop/py_scripts"
alias cpy="rsync -rh --info=progress2"

alias starwars="telnet towel.blinkenlights.nl"

