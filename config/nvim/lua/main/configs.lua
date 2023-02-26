vim.opt.number = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true

vim.opt.clipboard:append { 'unnamedplus' }

vim.opt.textwidth = 80
vim.opt.wrap = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.syntax = on

vim.opt.foldmethod = 'manual'

vim.opt.wildignore:append {
  '__pycache__', 'node_modules', '*pyc', '*.o', '*.a'
}

vim.opt.swapfile = false
vim.opt.switchbuf = 'vsplit'

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
