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
		texlive-core\
		jre8-openjdk\
		jde8-openjdk\
		gradle
}

function python_utils(){
	# Install python pip and extra modules
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python get-pip.py --user
	rm get-pip.py

	pip install --user requests
	pip install --user virtualenv
	pip install --user bs4
}

function android_utils() {
	# In android studio the package name is different
	aur_install "android-studio"
	# sudo pacman -U android-studio-3...
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
