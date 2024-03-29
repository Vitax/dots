.PHONY: setup setup-x setup-config setup-awesome setup-herbstluftwm setup-fonts clean clean-x clean-config clean-fonts clean-wm clean-bin

XDG_CONFIG_HOME=${HOME}/.config
XDG_FILES_DIR=${HOME}/files

# SetUp configuration files
# -------------------------
setup: setup-x setup-config setup-shell setup-fonts setup-bin

setup-x:
	ln -sf ${XDG_FILES_DIR}/dots/Xresources ${HOME}/.Xresources
	ln -sf ${XDG_FILES_DIR}/dots/xinitrc ${HOME}/.xinitrc
	ln -sf ${XDG_FILES_DIR}/dots/xmodmaprc ${HOME}/.xmodmaprc
	ln -sf ${XDG_FILES_DIR}/dots/profile ${HOME}/.profile
	ln -sf ${XDG_FILES_DIR}/dots/profile ${HOME}/.zprofile

setup-config:
	[ -d ${XDG_CONFIG_HOME} ] || mkdir ${XDG_CONFIG_HOME}
	ln -sf ${XDG_FILES_DIR}/dots/config/dunst ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/nvim ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/picom ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/redshift ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/kitty ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/ripgreprc ${HOME}/.ripgreprc
	ln -sf ${XDG_FILES_DIR}/dots/config/sxhkd ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/tmux ${XDG_CONFIG_HOME}/

setup-awesome:
	ln -sf ${XDG_FILES_DIR}/dots/config/awesome ${XDG_CONFIG_HOME}/

setup-herbstluftwm:
	ln -sf ${XDG_FILES_DIR}/dots/config/herbstluftwm ${XDG_CONFIG_HOME}/
	ln -sf ${XDG_FILES_DIR}/dots/config/polybar ${XDG_CONFIG_HOME}/

setup-shell:
	ln -sf ${XDG_FILES_DIR}/dots/shell/zsh/main.shellrc ${HOME}/.zshrc

setup-fonts:
	[ -d ${XDG_DATA_HOME}/.fonts ] && rm ${XDG_DATA_HOME}/.fonts ; \
		ln -sf ${XDG_DATA_XDG_FILES_DIR}/dots/fonts ${XDG_DATA_HOME}/.fonts ; \
		fc-cache -fv

setup-bin:
	ln -sf ${XDG_FILES_DIR}/bin ${HOME}

# CleanUp
# -------
clean: clean-x clean-config clean-shell clean-fonts clean-bin

clean-x:
	rm ${HOME}/.Xresources
	rm ${HOME}/.xmodmaprc
	rm ${HOME}/.xinitrc
	rm ${HOME}/.profile
	rm ${HOME}/.zprofile

clean-config:
	rm ${XDG_CONFIG_HOME}/dunst
	rm ${XDG_CONFIG_HOME}/nvim
	rm ${XDG_CONFIG_HOME}/picom
	rm ${XDG_CONFIG_HOME}/redshift
	rm ${HOME}/.ripgreprc
	rm ${XDG_CONFIG_HOME}/sxhkd
	rm ${XDG_CONFIG_HOME}/tmux

clean-wm:
	rm ${XDG_CONFIG_HOME}/awesome
	rm ${XDG_CONFIG_HOME}/herbstluftwm
	rm ${XDG_CONFIG_HOME}/polybar

clean-shell:
	rm ${HOME}/.zshrc

clean-fonts:
	rm ${XDG_DATA_HOME}/.fonts ; \
		fc-cache -fv

clean-bin:
	rm ${HOME}/bin
