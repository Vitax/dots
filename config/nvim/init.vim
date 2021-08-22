"" SetUp plugins
call plug#begin()
    "" Colorschemes
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'morhetz/gruvbox'

    "" Misc
    Plug 'itchyny/lightline.vim'
    Plug 'lilydjwg/colorizer'
    Plug 'Shougo/defx.nvim'
    Plug 'kristijanhusak/defx-icons'

    "" Utils
    Plug 'Shougo/denite.nvim'
    Plug 'easymotion/vim-easymotion'

    "" Programming utils
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    "" Programming cli
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

"" Directory path to the vim config.
let s:path = fnamemodify(expand('$MYVIMRC'), ':h')

"" Glob and source all the files in `path`
function! SourceAllIn(path)
    for s:fpath in split(globpath(s:path . a:path, '*.vim'), '\n')
        exe 'source' s:fpath
    endfor
endfunction

call SourceAllIn('/custom_plugs/')
call SourceAllIn('/config/')
call SourceAllIn('/bindings/')
