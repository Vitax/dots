autocmd BufWritePost * call defx#redraw()

call defx#custom#option('_', {
\   'winwidth': 35,
\   'split': 'vertical',
\   'direction': 'topleft',
\   'show_ignored_files': 0,
\   'buffer_name': '',
\   'toggle': 1,
\   'resume': 1,
\ })

call defx#custom#column('icon', {
\   'directory_icon': '',
\   'opened_icon': '',
\   'readonly_icon': '',
\   'root_icon': '',
\   'selected_icon': '*',
\ })


" let g:defx_icons_enable_syntax_highlight = 0
" let g:defx_icons_column_length = 0

" let g:defx_icons_directory_icon = ''
" let g:defx_icons_mark_icon = '*'
" let g:defx_icons_copy_icon = ''
" let g:defx_icons_link_icon = ''
" let g:defx_icons_move_icon = ''
" let g:defx_icons_parent_icon = ''
" let g:defx_icons_default_icon = ''
" let g:defx_icons_directory_symlink_icon = ''

" Options below are applicable only when using "tree" feature
" let g:defx_icons_root_opened_tree_icon = ''
" let g:defx_icons_nested_opened_tree_icon = ''
" let g:defx_icons_nested_closed_tree_icon = ''
