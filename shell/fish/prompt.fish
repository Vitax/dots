set -g fish_prompt_pwd_dir_length 80

function fish_mode_prompt -d "Write fish welcome prompt"
end

function fish_right_prompt -d "Write out the right prompt"
end

function fish_git_prompt -d "Write git prompt"
	command git symbolic-ref --short HEAD 2>/dev/null
        or command git name-rev --name-only HEAD 2>/dev/null
end

function user_prompt
	set_color -o 08A
	printf '%s ' "$USER"
end

function host_prompt
    set_color -o 08A
    printf '%s ' (prompt_hostname)
end

function pwd_prompt
	set_color -o blue
	printf '%s ' (prompt_pwd)
end

function git_prompt
    if test -d .git
        set_color CCC
        printf '%s' " "
        set_color -b CCC 28B
        printf ' %s ﴪ ' (fish_git_prompt)
        set_color -b normal
        set_color CCC
        printf '%s ' ""
    end
end

function fish_prompt
    user_prompt
    pwd_prompt
    git_prompt
	set_color normal
	printf '\n%s ' ""
end
