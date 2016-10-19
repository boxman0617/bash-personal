for f in ~/.bash_config/aliases/*.sh
do
	. "${f}"
done

# AutoGen
if [ -d "$HOME/.autogen_bash_aliases" ]; then
	. "$HOME/.autogen_bash_aliases"
fi