local opt = vim.opt
local g = vim.g

local config = require("main.utils").load_config()

local options = config.options
local ui = config.ui

-- color scheme
opt.termguicolors = true
opt.background = ui.background
g.colors_name = ui.theme

opt.completeopt = { "menuone", "noselect" }
opt.undofile = options.permanent_undo

opt.ruler = options.ruler
opt.hidden = options.hidden
opt.ignorecase = options.ignorecase
opt.smartcase = options.smartcase

opt.mouse = options.mouse

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"

opt.cmdheight = options.cmdheight
opt.updatetime = options.updatetime
opt.timeoutlen = options.timeoutlen
opt.clipboard = options.clipboard

opt.shortmess:append "sI"

opt.number = options.number
opt.numberwidth = options.numberwidth
opt.relativenumber = options.relativenumber
opt.expandtab = options.expandtab
opt.shiftwidth = options.shiftwidth
opt.smartindent = options.smartindent

opt.whichwrap:append "<>hl"

g.mapleader = options.mapleader
g.auto_save = options.autosave

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
