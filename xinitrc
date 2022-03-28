#!/bin/sh -e
# vim:ft=config

# Helpers
run() {
    cmd=$1
    shift
    if command -v $cmd >/dev/null && ! pgrep -f $cmd >/dev/null ; then
        printf 'Starting: %s\n' $cmd
        $cmd "$@" &
    fi
}

# Set capslock to change language layout
# --------------------------------------
setxkbmap -layout us,de
setxkbmap -option 'grp:caps_switch'
setxkbmap -option 'grp_led:caps'

{
    xrdb load ${HOME}/.Xresources
    xmodmap ~/.xmodmaprc
    xsetroot -cursor_name left_ptr
    xset r off
    xset m 0 0
    xset b off
    xset s 300 300
#    bright -s 20
#    vol -m
}

if [ "$(xrandr --listactivemonitors | grep dp-1)" != '' ] && [ "$(xrandr --listactivemonitors | grep hdmi-1)" != '' ]  ; then
    xrandr --output dp-1 --mode 2560x1440 --refresh 143.91 --output hdmi-1 --above dp-1
fi

run nitrogen --restore

run dunst
run emacs --daemon
run nm-applet
run /usr/libexec/polkit-gnome-authentication-agent-1
run picom --config ${XDG_CONFIG_HOME}/picom/picom.conf --experimental-backends
run redshift -c ${XDG_CONFIG_HOME}/redshift/redshift.conf
run sxhkd -c ${XDG_CONFIG_HOME}/sxhkd/sxhkdrc

run kitty

if command -v dwm > /dev/null; then
    run status_info

    unset -f run

    exec dwm
fi
