# fuzzy find cd
cd() {
	case $1 in
		\?)
			if [ -f "${XDG_CACHE_HOME:-${HOME}/.cache}"/last_dir ] ; then
				read -r loc < "${XDG_CACHE_HOME:-${HOME}/.cache}"/last_dir
				cd "$loc"
			fi
			;;
		*)
			if [ "$1" ] ; then
				builtin cd -- "$1" ||
				builtin cd -- "$1"* ||
				builtin cd -- *"$1" ||
				builtin cd -- *"$1"* ||
				builtin cd -- \
				"$(find . type d -maxdepth 1 -iname "*$1*" | head -n 1)"
			else
				builtin cd -- "${HOME}"
			fi 2>/dev/null

			if [ "$RANGER_LEVEL" ] ; then
				export PS1="[ranger: $(_ps1_print)] "
			else
				export PS1="$(_ps1_print)"
			fi

			case $1 in
				'.'|''|' ') ;;
				*)
					printf '%s\n' "$PWD" > \
						"${XDG_CACHE_HOME:-${HOME}/.cache}"/last_dir
			esac
	esac
}

