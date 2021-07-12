" Set background and color properties
set background=light
set t_Co=256
set termguicolors

" Set colorscheme
colorscheme PaperColor
" let g:gruvbox_contrast_dark="soft"
let g:airline_theme='papercolor'

" Enable plugin indention
filetype plugin indent on

" Set python host
let g:python3_host_prog='/usr/sbin/python3'

" Set text encoding
set encoding=UTF-8

" Read buffer on change
set autoread
set incsearch

" Enable displaying tab and space characters
set list

" Enable smart case search
set ignorecase
set smartcase

" Reduce shortcut delay
set timeoutlen=300

" setup usage of system clipboard
set clipboard=unnamedplus

" Make buffers easier to handle
setlocal buftype=""
setlocal bufhidden=hide

" Do not create swap files
setlocal noswapfile

" Split buffers to the right by default
set splitright

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Always show sign columns
set signcolumn=yes

" Appearance
set linebreak
set laststatus=2
set noshowmode
set number
set showcmd
syntax on
set textwidth=80
set wrap

" Tab configuration
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

set softtabstop=4
set shiftround

let bclose_multiple = 0
