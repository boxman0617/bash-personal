#!/usr/bin/env bash
if [ ! -d "$HOME/.nvm" ]; then
	mkdir install
	cd install

	# Pull down and install nvm (node version manager)
	curl https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

	# Set up nvm profile
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

	# Set node version
	nvm install node
	nvm alias default node

	cd ..
	rm -rf install
fi

PROFILE="$HOME/.bashrc"
if [ ! -d "$HOME/.bashrc" ]; then
	if [ -d "$HOME/.profile" ]; then
		PROFILE="$HOME/.profile"
	fi
	if [ -d "$HOME/.bash_profile" ]; then
		PROFILE="$HOME/.bash_profile"
	fi
fi

## Installing Bash Personal
echo "" >> "$PROFILE"
echo "# Bash Personal Settings" >> "$PROFILE"
echo "export BASH_PERSONAL_BASE=\"$PROFILE\"" >> "$PROFILE"
echo "if [ -f ~/.bash_personal ]; then" >> "$PROFILE"
echo "    . ~/.bash_personal" >> "$PROFILE"
echo "fi" >> "$PROFILE"
echo "" >> "$PROFILE"

cp -rf .bash_* ~/
mkdir ~/.logs