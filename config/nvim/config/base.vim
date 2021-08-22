" Set background and color properties
set background=light
set t_Co=256
set termguicolors

" Set colorscheme
colorscheme PaperColor
let g:lightline = { 'colorscheme': 'PaperColor' }

" Enable plugin indention
filetype plugin indent on

" Set python host
let g:python3_host_prog='/usr/bin/python3'

" Set text encoding
set encoding=UTF-8

" Read buffer on change
set autoread
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu

" Enable displaying tab and space characters
set list listchars=trail:»,tab:»-

" Reduce shortcut delay
set timeoutlen=300

" Set terminal title
set title

" setup usage of system clipboard
set clipboard=unnamedplus

" Make buffers easier to handle
set hidden buftype="" bufhidden=hide

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
syntax on
set linebreak
set laststatus=2 showcmd noshowmode
set number textwidth=80
set wrap breakindent

" Tab configuration
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab shiftround autoindent
let bclose_multiple = 0

" Cleanup tailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
