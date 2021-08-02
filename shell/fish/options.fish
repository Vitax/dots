# Force 24 Bit colors in fish shell
set -g fish_term24bit 1

# Vim mode options
fish_vi_key_bindings --no-erase default

bind -M insert \cc "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"
bind \cc ''

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# Disable fish greeting
set fish_greeting
