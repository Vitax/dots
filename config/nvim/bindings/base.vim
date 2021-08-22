"" Keybindings
let mapleader = ","

" Simplify common used commands and keys in nvim
noremap ; :
nnoremap <silent><leader><leader> :nohls <CR>

" Simplify saving files and closing nvim
noremap <leader>w :w <CR>
noremap <leader>q :q <CR>
noremap <leader>Q :q <CR>

" Shortcut to simplify opening files
nnoremap <C-x>f :edit<space>

" Move through and close buffers
nnoremap <silent> tk :bp <CR>
nnoremap <silent> tj :bn <CR>
nnoremap <silent> td :Bclose <CR>

