"" Keybindings
" Set leader key
let mapleader = ","

" Simplify common used commands and keys in nvim
noremap ; :
nmap <leader><leader> :nohl <CR>

" Simplify saving files and closing nvim
noremap <leader>w :w <CR>
noremap <leader>q :q <CR>
noremap <leader>Q :q <CR>

" Shortcut to simplify opening files
nmap <C-x>f :edit<space>

" Move through and close buffers
nnoremap <silent> tk :bp <CR>
nnoremap <silent> tj :bn <CR>
nnoremap <silent> td :Bclose <CR>

" Move through splits
nnoremap <silent> <C-h> <C-w>h <CR>
nnoremap <silent> <C-j> <C-w>j <CR>
nnoremap <silent> <C-k> <C-w>k <CR>
nnoremap <silent> <C-l> <C-w>l <CR>

