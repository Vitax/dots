local globals = require("main.globals")

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

opt.number = true
opt.title = true

opt.syntax = on
opt.termguicolors = true
opt.background = globals.ui.background
cmd("colorscheme " .. globals.ui.theme)

opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.smarttab = true

opt.clipboard:append { 'unnamedplus' }
opt.ignorecase = true
opt.smartcase = true

opt.textwidth = 80
opt.wrap = true

opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true

opt.foldmethod = 'manual'

opt.wildignore:append {
  '.git', '__pycache__', 'node_modules', '*pyc', '*.o', '*.a'
}

opt.swapfile = false

opt.switchbuf = 'vsplit'
opt.splitbelow = true
opt.splitright = true

local disabled_built_ins = {
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "gzip",
   "zip",
   "zipPlugin",
   "tar",
   "tarPlugin",
   "getscript",
   "getscriptPlugin",
   "vimball",
   "vimballPlugin",
   "2html_plugin",
   "logipat",
   "rrhelper",
   "spellfile_plugin",
   "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
