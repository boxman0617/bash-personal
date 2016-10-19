#!/usr/bin/env bash
slowtype() {
    while IFS= read -r line; do
        length="${#line}"
        bol=1
        for (( offset = 0 ; offset < length ; offset++ )); do
            char="${line:offset:1}"
            printf '%s' "$char"
            if (( bol )) && [[ "$char" == " " ]]; then
                continue
            fi
            bol=0
            sleep 0.03
        done

        if (( length == 0 )); then
            sleep 0.$(( RANDOM % 3 + 2 ))
        else
            sleep 0.$(( RANDOM % 7 + 3 ))
        fi

        printf '\n'
    done
}
echo "!=> ########################################################"
echo "!=> Bash Personal"
echo "!=> ########################################################"
echo "==> Checking if NVM is installed..." | slowtype
if [ ! -d "$HOME/.nvm" ]; then
	echo "!=> Not installed!" | slowtype
	echo "==> Installing..." | slowtype
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
echo "==> Installed!" | slowtype

echo "==> Figuring out main bash script..." | slowtype
PROFILE="$HOME/.bashrc"
if [ ! -f "$HOME/.bashrc" ]; then
	if [ -f "$HOME/.profile" ]; then
		PROFILE="$HOME/.profile"
	fi
	if [ -f "$HOME/.bash_profile" ]; then
		PROFILE="$HOME/.bash_profile"
	fi	
fi
echo "i=> $PROFILE" | slowtype

## Installing Bash Personal
echo "==> Installing BashPersonal..." | slowtype
echo "" >> "$PROFILE"
echo "# Bash Personal Settings" >> "$PROFILE"
echo "export BASH_PERSONAL_BASE=\"$PROFILE\"" >> "$PROFILE"
echo "if [ -f ~/.bash_personal ]; then" >> "$PROFILE"
echo "    . ~/.bash_personal" >> "$PROFILE"
echo "fi" >> "$PROFILE"
echo "" >> "$PROFILE"

cp -rf .bash_* ~/
mkdir ~/.logs
echo "==> Installed!" | slowtype
echo "==>"
echo "==> Thank you for installing BashPersonal! Enjoy! :)"