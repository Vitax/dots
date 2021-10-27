#!/bin/sh -e
# vim:ft=config

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
    bright -s 20
    vol -m
}

dunst &
picom --config ${XDG_CONFIG_HOME}/picom/picom.conf --experimental-backends &
redshift -c ${XDG_CONFIG_HOME}/redshift/redshift.conf &
sxhkd -c ${XDG_CONFIG_HOME}/sxhkd/sxhkdrc &

[ -f ${HOME}/.fehbg ] && ${HOME}/.fehbg

stwrapper &
status_bar dwm &

while : ; do
    dwm && break || continue
done
