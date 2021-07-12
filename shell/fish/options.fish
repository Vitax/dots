# Vim mode options
function fish_user_key_bindings
    fish_default_key_bindings -M insert

    fish_vi_key_bindings --no-erase insert
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# Disable fish greeting
set fish_greeting

