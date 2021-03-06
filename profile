#!/bin/sh
umask 022

# Set system path
# ---------------
PATH=/bin:/sbin
PATH=/usr/sbin:/usr/bin:$PATH
PATH=/usr/X11R6/bin:$PATH
PATH=/usr/local/sbin:/usr/local/bin:$PATH
PATH=$(printf '%s:' ${HOME}/bin/*/)${HOME}/bin:$PATH
PATH=${HOME}/.local/bin:$PATH
export PATH

MANPATH=$(printf '%s:' ${HOME}/.local/share/man/man1/*/)
MANPATH="/usr/share/man/man1/:$MANPATH"
export MANPATH

# Define system language
# ----------------------
export LC_CTYPE='en_US.UTF-8'
export LANG="$LC_CTYPE" \
       LANGUAGE="$LC_CTYPE" \
       LOCALE="$LC_CTYPE"
       LC_ALL="$LC_CTYPE" \

export XDG_MENU_PREFIX="xdg-"
export XDG_CURRENT_DESKTOP=X11
 
# Set editor
# ----------
export EDITOR=nvim

# Set compiling and various dev flags
# ---------------------------
export CFLAGS='-O2 -pipe -fstack-protector-strong -fexceptions'
# export NPROC=$(sysctl -n hw.ncpu)

# Set custom variables for folders
# --------------------------------
export XDG_CONFIG_HOME="${HOME}/.config" \
       XDG_DOWNLOAD_DIR="${HOME}/downloads" \
       XDG_DOCUMENTS_DIR="${HOME}/documents" \
       XDG_FILES_DIR="${HOME}/files" \
       XDG_MUSIC_DIR="${HOME}/music" \
       XDG_PICTURES_DIR="${HOME}/images" \
       XDG_VIDEOS_DIR="${HOME}/videos"


export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DESKTOP_DIR="${HOME}/Desktop"
export TRASH_DIR="${XDG_DATA_HOME}/Trash"

export XDG_OPEN=open

export ENV="${XDG_FILES_DIR}/dots/shell/ksh/main.shellrc"

# Set java variables
# ------------------
export _JAVA_AWT_WM_NONREPARENTING=1

# Remove titlebar in firefox
# --------------------------
export MOZ_GTK_TITLEBAR_DECORATION=client

# Enable touch input for firefox
# ------------------------------
export MOZ_USE_XINPUT2=1

# Disable telemetry in firefox
# -------------------------
export MOZ_DATA_REPORTING=0
export MOZ_TELEMETRY_REPORTING=0

# Set mpd socket host
# -----------------------
export MPD_HOST="${HOME}/.config/mpd/socket"

# Empty ${HOME}/tmp folder on startup
# -----------------------------------
rm -rf ${HOME}/tmp 2>/dev/null ||:
mkdir -p ${HOME}/tmp
