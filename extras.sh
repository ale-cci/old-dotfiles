#!/bin/zsh
source $HOME/.zshrc
# Script currently under development
function deez_install () {
	cd $HOME
	git clone https://notabug.org/RemixDevs/DeezloaderRemix.git

	(cd DeezloaderRemix && npm install)
}

function pack_packages() {
	sudo pacman -S \
		chromium\
		pandoc\
		texlive-core
}

function python_utils(){
	# Install python pip and extra modules
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python get-pip.py --user
	rm get-pip.py

	pip install --user requests
	pip install --user bs4
}

function android_utils() {
	aur_install "android-studio"
	aur_install "android-sdk"
	aur_install "android-emulator"

}

function main(){
	python_utils
	pack_packages
	deez_install
	android_utils
}

android_utils
#main
