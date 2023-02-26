#!/bin/sh -e
# vim:ft=config

# Helpers
WM=i3

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
    xset r 5 250
    xset m 0 0
    xset b off
    xset s 300 300
}

run dunst
run kitty
run nitrogen --restore
run nm-applet
run pcmanfm -d
run picom --config ${XDG_CONFIG_HOME}/picom/picom.conf
run redshift -c ${XDG_CONFIG_HOME}/redshift/redshift.conf
run xsettingsd
run xss-lock -- slock

if command -v $WM > /dev/null; then
    unset -f run

    exec $WM
fi

