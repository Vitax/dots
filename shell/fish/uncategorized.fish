# Get weather for berlin
# ----------------------
alias weather 'curl -s wttr.in/berlin.sd?0'
alias forecast 'curl -s wttr.in/berlin.sd | tail -n 33 | head -n 31'

# Set capslock to change language layout
# --------------------------------------
setxkbmap -layout us,de
setxkbmap -option 'grp:caps_switch'
setxkbmap -option 'grp_led:caps'

# Override youtube dl
alias ytdl 'youtube-dl -c -R 50 --geo-bypass --prefer-ffmpeg'
alias ytdlm 'youtube-dl -x -c -R 50 --geo-bypass --prefer-ffmpeg'

# Function to get a cheatsheet for whatever you want
# --------------------------------------------------
function cheat
	curl -s cheat.sh/$1;
end

# Aliases to set and get clipbaord in shell
# -----------------------------------------
alias setclip 'xclip -selection "clipboard" -i'
alias getclip 'xclip -o'
