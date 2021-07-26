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
\   'directory_icon': ' ',
\   'opened_icon': ' ',
\   'readonly_icon': ' ',
\   'root_icon': ' ',
\   'selected_icon': '* ',
\ })
