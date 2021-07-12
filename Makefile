.PHONY: setup setup-x setup-config setup-fonts clean clean-x clean-config clean-fonts

SH=$(echo $SHELL)
XDG_CONFIG_HOME=${HOME}/.config
XDG_FILES_DIR=${HOME}/files

# SetUp
# -----
setup: setup-x setup-config setup-fonts setup-bin setup-shell

setup-x:
	ln -sf ${XDG_FILES_DIR}/dots/Xresources ${HOME}/.Xresources
	ln -sf ${XDG_FILES_DIR}/dots/xinitrc ${HOME}/.xinitrc
	ln -sf ${XDG_FILES_DIR}/dots/xmodmaprc ${HOME}/.xmodmaprc
	ln -sf ${XDG_FILES_DIR}/dots/profile ${HOME}/.profile

setup-config:
	if [ ! -d ${XDG_CONFIG_HOME} ] ; then mkdir ${XDG_CONFIG_HOME} ; fi
	ln -sf ${XDG_FILES_DIR}/dots/config/nvim ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/picom ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/dunst ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/redshift ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/rofi ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/sxhkd ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/tmux ${XDG_CONFIG_HOME}/

setup-shell:
	ln -sf ${XDG_FILES_DIR}/dots/shell/ksh/main.shell ${HOME}/.kshrc
	ln -sf ${XDG_FILES_DIR}/dots/shell/fish ${XDG_CONFIG_HOME}/

setup-fonts:
	[ -d ${HOME}/.fonts ] && rm ${HOME}/.fonts ;
	ln -sf ${XDG_FILES_DIR}/dots/fonts ${HOME}/.fonts ;
	fc-cache -fv

setup-bin:
	ln -sf ${XDG_FILES_DIR}/bin ${HOME}

# CleanUp
# -------
clean: clean-x clean-config clean-fonts clean-bin

clean-x:
	rm ${HOME}/.Xresources
	rm ${HOME}/.xmodmaprc
	rm ${HOME}/.xinitrc
	rm ${HOME}/.profile

clean-config:
	rm ${XDG_CONFIG_HOME}/nvim
	rm ${XDG_CONFIG_HOME}/picom 
	rm ${XDG_CONFIG_HOME}/redshift
	rm ${XDG_CONFIG_HOME}/rofi
	rm ${XDG_CONFIG_HOME}/sxhkd
	rm ${XDG_CONFIG_HOME}/tmux

clean-fonts:
	rm ${HOME}/.fonts ; fc-cache -fv

clean-bin:
	rm ${HOME}/bin
