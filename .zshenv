#!/bin/sh

export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"
export FILE="vu"
export READER="zathura"

export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"

# Project Directories
export BEIFI_DIR="$HOME/Desktop/membership"
export BEIFI_MOBILE_DIR="$HOME/Desktop/beifi_mobile"

export ANDROID_HOME="$HOME/Android/Sdk"
export JAVA_HOME="/usr/lib/jvm/default"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
