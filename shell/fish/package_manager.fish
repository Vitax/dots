# This file aims to unify the command prompt for installing packages from all distros

# ArchLinux
# ---------
if type -q pacman == 0
	function pkg
		set flag $argv[1]
		set --erase argv[1]
		switch $flag
			case a
				sudo pacman -Syu $argv ;;
			case s
				sudo pacman -Ss $argv ;;
			case d
				sudo pacman -Rscnd $argv ;;
			case u
				sudo pacman -Syu ;;
		end
	end
end

# VoidLinux
# ---------
if type -q xbps-install == 0
	function pkg
		set flag $argv[1]
		set --erase argv[1]
		switch $flag
			case a
				sudo xbps-install -S $argv ;;
			case s
				xbps-query -Rs $argv ;;
			case d
				sudo xbps-remove -R $argv ; sudo xbps-remove -of ;; sudo xbps-remove -O ;;
			case u
				sudo xbps-install -Su ;;
		end
	end
end
