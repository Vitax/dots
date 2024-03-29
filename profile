#!/bin/sh

umask 022

export $(dbus-launch)

# Set system path
# ---------------
#PATH=/bin:/sbin
#PATH=/usr/sbin:/usr/bin:$PATH
#PATH=/usr/local/sbin:/usr/local/bin:$PATH
SYS_PATH=$PATH
PATH=$SYS_PATH
for dir in ${HOME}/bin/*; do
	PATH=${dir}:$PATH
done
PATH=${HOME}/.local/bin:$PATH
PATH=${HOME}/node_modules/.bin:$PATH
export PATH

MANPATH=${HOME}/.local/share/man/man1/:$MANPATH
export MANPATH

# ----------------------
export LC_CTYPE='en_US.UTF-8'
export LANG="$LC_CTYPE" \
       LANGUAGE="$LC_CTYPE" \
       LOCALE="$LC_CTYPE" \
       LC_ALL="$LC_CTYPE"

# Set editor
# ----------
export EDITOR=nvim


# Set compiling and various dev flags
# ---------------------------
# export CFLAGS='-O2 -pipe -s -fstack-protector-strong'
case $(uname) in
    Linux)
        if command -v nproc >/dev/null ; then
            export NPROC="$(nproc)"
        fi
        ;;
    *BSD)
        export NPROC="$(sysctl -n hw.ncpu)"
esac

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
rm -rf ${HOME}/Downloads 2>/dev/null
rm -rf ${HOME}/tmp 2>/dev/null
mkdir -p ${HOME}/tmp
