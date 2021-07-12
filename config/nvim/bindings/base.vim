" Keybindings
let mapleader = ","

noremap ; :
noremap <leader>w :w <CR>
noremap <leader>q :q <CR>
noremap <leader>Q :q <CR>

" Move through buffers
nnoremap <silent> tk :bp <CR>
nnoremap <silent> tj :bn <CR>
nnoremap <silent> td :Bclose <CR>

" Move through splits
nnoremap <silent> <C-h> <C-w>h <CR>
nnoremap <silent> <C-j> <C-w>j <CR>
nnoremap <silent> <C-k> <C-w>k <CR>
nnoremap <silent> <C-l> <C-w>l <CR>

