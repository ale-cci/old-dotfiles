#!/bin/sh

export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"
export READER="zathura"

export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"

