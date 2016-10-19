long_history() {
	if [ "$(id -u)" -ne 0 ]; then 
		echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; 
	fi
}

press() {
	NOW=$(date +%y-%m-%d)
	NAME_OF_TAR="${1}-${NOW}.tar.gz"
	tar --remove-files -zcvf $NAME_OF_TAR $1
}
unpress() {
	tar -zxvf $1
}

addalias() {
	local aliasName="$1"
	local aliasCmd="$2"
	echo "alias ${aliasName}=\"${aliasCmd}\"" >> ~/.autogen_bash_aliases
	refresh
}