set -g fish_prompt_pwd_dir_length 80

function fish_mode_prompt -d "Write fish welcome prompt"
end

function fish_right_prompt -d "Write out the right prompt"
end

function fish_git_prompt -d "Write git prompt"
	command git symbolic-ref --short HEAD 2>/dev/null;
		or command git name-rev --name-only HEAD 2>/dev/null
end

function fish_prompt
	set_color -o blue
	printf '%s' (prompt_pwd)
	set_color green
	printf ' (%s) ' (date "+%H:%M")
	set_color magenta
	printf '%s' (fish_git_prompt)
	set_color -o normal
	printf '%s\n> '
end
