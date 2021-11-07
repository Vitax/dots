vim.cmd [[ au VimEnter * if &buftype != "terminal" | lcd %:p:h | endif ]]

vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

vim.cmd [[ au BufEnter,BufWinEnter,FileType,WinEnter * lua require("main.utils").hide_statusline() ]]
