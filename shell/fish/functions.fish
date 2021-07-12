# Functions to easily move files into important / often used directories
# ----------------------------------------------------------------------
function mcf
	mv $argv $XDG_CONFIG_HOME
end

function mch
	mv $argv $XDG_CACHE_HOME
end

function md
	mv $argv $XDG_DOCUMENTS_DIR
end

function mdo
	mv $argv $XDG_DOWNLOAD_DIR
end

function metc
	mv $argv /etc
end

function mf
	mv $argv $XDG_FILES_DIR
end

function mfb
	mv $argv $XDG_FILES_DIR/bin
end

function mfc
	mv $argv $XDG_FILES_DIR/code
end

function mfd
	mv $argv $XDG_FILES_DIR/dots
end

function mfs
	mv $argv $XDG_FILES_DIR/suckless
end

function mi
	mv $argv $XDG_PICTURES_PATH
end

function mmnt
	mv $argv /mnt
end

function mmu
	mv $argv $XDG_MUSIC_PATH
end

function mtmp
	mv $argv /tmp
end

function mvar
	mv $argv /var
end

function mvi
	mv $argv $XDG_VIDEO_DIR
end

function mw
	mv $argv $XDG_PICTURES_PATH/wallpapers
end

# Functions to easily copy files into important / often used directories
# ----------------------------------------------------------------------
function ycf
	cp $argv $XDG_CONFIG_HOME
end

function ych
	cp $argv $XDG_CACHE_HOME
end

function yd
	cp $argv $XDG_DOCUMENTS_DIR
end

function ydo
	cp $argv $XDG_DOWNLOAD_DIR
end

function yetc
	cp $argv /etc
end

function yf
	cp $argv $XDG_FILES_DIR
end

function yfb
	cp $argv $XDG_FILES_DIR/bin
end

function yfc
	cp $argv $XDG_FILES_DIR/code
end

function yfd
	cp $argv $XDG_FILES_DIR/dots
end

function yfs
	cp $argv $XDG_FILES_DIR/suckless
end

function yi
	cp $argv $XDG_PICTURES_PATH
end

function ymmnt
	cp $argv /mnt
end

function ymu
	cp $argv $XDG_MUSIC_PATH
end

function ytmp
	cp $argv /tmp
end

function yvar -d "Copy files or directory into system var path"
	cp $argv /var
end

function yvi -d "Copy files or directory into user videos path"
	cp $argv $XDG_VIDEO_DIR
end

function yw -d "Copy files or directory into user wallpapers path"
	cp $argv $XDG_PICTURES_PATH/wallpapers
end

# Helper function to easily recompile suckless tools
# --------------------------------------------------
function rcp -d "Build suckless tools"
	$XDG_FILES_DIR/src/suckless/build $argv ;
end
