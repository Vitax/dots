#!/bin/sh
# vim:ft=config

[ -f ${HOME}/.profile ] && . ${HOME}/.profile

# Set xrdb and xmodmap
# --------------------
xrdb load ${HOME}/.Xresources
xmodmap ${HOME}/.xmodmaprc

# Set cursor of x session
# -----------------------
xsetroot -cursor_name left_ptr

# Set keyboard keyrepeat
# ----------------------
xset r rate 500 75

# Change mouse acceleration and sensitivity
# -----------------------------------------
xset m 0 0
xset b off

# Set timeout when the screensaver should enable
# ----------------------------------------------
xset s 1800 1800

# Set autolock timer
# ------------------
xautolock -time 10 -locker slock &

# Set wallpaper
# -------------
xwallpaper --daemon --maximize ${XDG_PICTURES_DIR}/wallpapers/wallhaven-dg6lzm.jpg

# Set brightness on launch
# ------------------------
bright -s 20

# Launch applications on startup
# ------------------------------
picom --config ${XDG_CONFIG_HOME}/picom/picom.conf --experimental-backends &
redshift -c ${XDG_CONFIG_HOME}/redshift/redshift.conf &
sxhkd -c ${XDG_CONFIG_HOME}/sxhkd/sxhkdrc &
xbanish -i shift -i control -i alt -i super &

st -T "Suckless Terminal" -t "Suckless Terminal" -c "Suckless Terminal" &

# Launch tiling window manager
# ----------------------------
if command -v dwm >/dev/null ; then
	dwmblocks &
	exec dwm
else
    exec fvwm
fi
