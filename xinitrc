#!/bin/sh -e
# vim:ft=config

# Helpers
WM=dwm

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
}

run nitrogen --restore

run xfsettingsd
run xfce4-power-manager
run xss-lock -- slock
run picom --config ${XDG_CONFIG_HOME}/picom/picom.conf --experimental-backends
run redshift -c ${XDG_CONFIG_HOME}/redshift/redshift.conf
run dunst

run emacs --daemon
run nm-applet
run thunar --daemon
run /usr/libexec/xfce-polkit

run kitty

if command -v $WM > /dev/null; then
    case $WM in
	openbox)
	    run polybar -r
	    run plank
    run sxhkd -c ${XDG_CONFIG_HOME}/sxhkd/sxhkdrc
	    ;;
	herbstluftwm)
	    run polybar -r
	    run plank
	    ;;
	dwm)
	    run status_info
	    run stalonetray
	    run sxhkd -c ${XDG_CONFIG_HOME}/sxhkd/sxhkdrc
	    ;;
    esac

    unset -f run

    exec $WM
fi

