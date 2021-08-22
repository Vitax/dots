if command -v doas >/dev/null ; then
	alias sudo='TERM=vt100 doas'
elif command -v sudo >/dev/null ; then
	alias doas='TERM=vt100 sudo'
else
	alias {sudo,doas}='TERM=vt100 su -C'
fi

case $TERM in
	*-256color)
		if command -v exa >/dev/null ; then 
			alias ls='exa --group-directories-first'
			alias tree='la --tree'
		else
			alias ls='ls -F'
		fi
		;;
	*)
		alias ls='ls -F'
		export NO_COLOR=true
esac
