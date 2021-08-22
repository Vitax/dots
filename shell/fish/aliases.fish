# Simplify application commands
# -----------------------------
alias dc 'docker compose'
alias disks 'geom disk list'
alias vim nvim
alias svim sudoedit
alias w3m 'w3m https://lite.duckduckgo.com'

# Aliases to simplify the ls command
# ----------------------------------
if type -q exa == 0
	alias ls 'exa --group-directories-first'
end

alias l ls
alias la 'l -a'
alias lsa 'l -a'
alias ll 'l -l'
alias lla 'l -la'

# Aliases to simplify default make commands
alias mki 'make install'
alias mku 'make uninstall'
alias mkc 'make clean'

# Aliases to simplify unix commands
# ---------------------------------
alias cp 'cp -iv'
alias cl 'clear'
alias clr 'clear'
alias claer 'clear'
alias clear 'clear'
alias cxa 'chmod +x'
alias cxr 'chmod -x'
alias fcg 'fc-list | grep'
alias mkd mkdir
alias mkdr mkdir
alias mkidr mkdir
alias mv 'mv -iv'
alias ovpn 'sudo openvpn'
alias p 'ping'
alias pk 'pkill'
alias psg 'ps aux | grep'
alias psgrep 'ps aux | grep'
alias q exit
alias qq exit
alias quit exit
alias tf 'tail -f'
alias w which

# Aliases to cd into important / often used directories
# -----------------------------------------------------
alias gcf 'cd $XDG_CONFIG_HOME; ls'
alias gch 'cd $XDG_CACHE_HOME'
alias gd 'cd $XDG_DOCUMENTS_DIR'
alias gdo 'cd $XDG_DOWNLOAD_DIR'
alias getc 'cd /etc'
alias gf 'cd $XDG_FILES_DIR'
alias gfb 'cd $XDG_FILES_DIR/bin'
alias gfc 'cd $XDG_FILES_DIR/code'
alias gfd 'cd $XDG_FILES_DIR/dots'
alias gfs 'cd $XDG_FILES_DIR/src'
alias gfss 'cd $XDG_FILES_DIR/src/suckless'
alias gi 'cd $XDG_PICTURES_PATH'
alias gmnt 'cd /mnt'
alias gmu 'cd $XDG_MUSIC_PATH'
alias gtmp 'cd /tmp'
alias gvi 'cd $XDG_VIDEO_DIR'
alias gvar 'cd /var'
alias gw 'cd $XDG_PICTURES_PATH/wallpapers'

# Fish helper aliases
# -------------------
alias fishprofile 'vim $HOME/.config/fish/config.fish'
alias fishreboot 'source $HOME/.config/fish/config.fish $argv'
