local cfg_bindings = require("utils").load_config().bindings
local misc_map = cfg_bindings.misc

local cmd = vim.cmd

-- region helpers

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }

    if options then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- endregion helpers


local bindings = {}
local opt = {}

function bindings.misc()
    map("n", misc_map.toggle_linenr, ":set nu!<CR>", opt)
    map("", misc_map.save_file, ":w <CR>", opt)
    map("", misc_map.hide_hls, ":nohls <CR>", opt)


    cmd "silent! command PackerCompile lua require 'plugin_list' require('packer').compile()"
    cmd "silent! command PackerInstall lua require 'plugin_list' require('packer').install()"
    cmd "silent! command PackerStatus lua require 'plugin_list' require('packer').status()"
    cmd "silent! command PackerSync lua require 'plugin_list' require('packer').sync()"
    cmd "silent! command PackerUpdate lua require 'plugin_list' require('packer').update()"
end

-- region plugin_bindings
function bindings.bufferline()
    local m = cfg_bindings.bufferline

    map("n", m.new_buffer, ":enew<CR>", opt) -- new buffer
    map("n", m.newtab, ":tabnew<CR>", opt) -- new tab
    map("n", m.close, ":lua require('utils').close_buffer() <CR>", opt) 

    map("n", m.cycleNext, ":BufferLineCycleNext<CR>", opt)
    map("n", m.cyclePrev, ":BufferLineCyclePrev<CR>", opt)
end

function bindings.comment_nvim()
    local m = cfg_bindings.comment_nvim.comment_toggle

    map("n", m, ":CommentToggle<CR>", opt)
    map("v", m, ":CommentToggle<CR>", opt)
end

function bindings.fugitive()
    local m = cfg_bindings.fugitive

    map("n", m.Git, ":Git<CR>", opt)
    map("n", m.diffget_2, ":diffget //2<CR>", opt)
    map("n", m.diffget_3, ":diffget //3<CR>", opt)
    map("n", m.git_blame, ":Git blame<CR>", opt)
end

function bindings.nvimtree()
    local m = cfg_bindings.nvimtree.treetoggle

    map("n", m, ":NvimTreeToggle<CR>", opt)
end

function bindings.neoformat()
    local m = cfg_bindings.neoformat.format
    map("n", m, ":Neoformat<CR>", opt)
end

function bindings.truezen()
    local m = cfg_bindings.truezen

    map("n", m.ataraxisMode, ":TZAtaraxis<CR>", opt)
    map("n", m.minimalisticmode, ":TZMinimalist<CR>", opt)
    map("n", m.focusmode, ":TZFocus<CR>", opt)
end

function bindings.telescope()
    local m = cfg_bindings.telescope

    map("n", m.live_grep, ":Telescope live_grep<CR>", opt)
    map("n", m.git_status, ":Telescope git_status <CR>", opt)
    map("n", m.git_commits, ":Telescope git_commits <CR>", opt)
    map("n", m.find_files, ":Telescope find_files <CR>", opt)
    map("n", m.buffers, ":Telescope buffers<CR>", opt)
    map("n", m.help_tags, ":Telescope help_tags<CR>", opt)
    map("n", m.oldfiles, ":Telescope oldfiles<CR>", opt)
end

-- endregion plugin_bindings

return bindings
