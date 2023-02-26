local utils = require('main.utils')

local silent_opt = { silent = true }

vim.g.mapleader = ','

utils.map('n', ';', ':')
utils.map('n', 'tj', ':bn<CR>', silent_opt)
utils.map('n', 'tk', ':bp<CR>', silent_opt)
utils.map('n', 'td', ':bd<CR>', silent_opt)

utils.map('n', '<leader>rc', ':luafile ~/.config/nvim/init.lua<CR>', silent_opt)

utils.map('n', '<leader>w', ':w<CR>', silent_opt)
utils.map('n', '<leader>Q', ':q<CR>', silent_opt)
