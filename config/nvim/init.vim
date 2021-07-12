" SetUp plugins
call plug#begin()
    "" Colorschemes
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline-themes'

    "" Utility
    Plug 'vim-airline/vim-airline'
    Plug 'Shougo/denite.nvim', { 'do' : 'UpdateRemotePlugins' }
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'tpope/vim-commentary'

    "" Programming tools
    Plug 'neoclide/coc.nvim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'tpope/vim-surround'
call plug#end()

" Directory path to the vim config.
let s:path = fnamemodify(expand('$MYVIMRC'), ':h')

" Glob and source all the files in `path`
function! SourceAllIn(path)
    for s:fpath in split(globpath(s:path . a:path, '*.vim'), '\n')
        exe 'source' s:fpath
    endfor
endfunction

call SourceAllIn('/custom_plugs/')
call SourceAllIn('/config/')
call SourceAllIn('/bindings/')
