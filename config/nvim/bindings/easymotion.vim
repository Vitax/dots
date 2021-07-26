" <leader>f{char} to move to {char}
map  <leader>F <plug>(easymotion-bd-f)
nmap <leader>F <plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <plug>(easymotion-overwin-f2)

" Move to line
map <leader>L <plug>(easymotion-bd-jk)
nmap <leader>L <plug>(easymotion-overwin-line)

" Move to word
map  <leader>W <plug>(easymotion-bd-w)
nmap <leader>W <plug>(easymotion-overwin-w)

" Override default nvim search with easymotions one
map  / <plug>(easymotion-sn)
omap / <plug>(easymotion-tn)

" Override n and N with easymotion commands
map  n <plug>(easymotion-next)
map  N <plug>(easymotion-prev)
