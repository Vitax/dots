vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

vim.cmd [[ autocmd BufEnter,BufWinEnter,WinEnter,CmdwinEnter,TermEnter * lua require("main.utils").hide_statusline() ]]
