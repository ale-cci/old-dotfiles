#!/bin/sh

# Script currently under development


# Install python pip and extra modules
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
rm get-pip.py

pip install --user requests
pip install --user bs4

sudo pacman -S \
	chrmoium\
	pandoc\
	texlive-core

# Install all the heavier and low-priority programs, like:
# - android-studio
aur_install "android-studio"
aur_install "android-sdk"
aur_install "android-emulator"


