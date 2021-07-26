" SetUp plugins
call plug#begin()
    "" Colorschemes
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline-themes'

    "" Misc
    Plug 'lilydjwg/colorizer'

    "" Utility
    Plug 'vim-airline/vim-airline'
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/defx.nvim'

    "" Programming tools
    Plug 'neoclide/coc.nvim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'tpope/vim-surround'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
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
