local cfg_bindings = require("main.utils").load_config().bindings
local misc_map = cfg_bindings.misc
local term_maps = cfg_bindings.terminal

local cmd = vim.cmd

-- region helpers
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    local _opts = opts or {}

    if opts ~= {} then
        options = vim.tbl_extend("force", options, _opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- endregion helpers


local bindings = {}
local silent_opt = { silent = true }

function bindings.misc()
    map("n", misc_map.easy_command, ":")
    map("n", misc_map.easy_open_file, ":edit ")
    map("n", misc_map.close_window, ":q<CR>", silent_opt)
    map("n", misc_map.toggle_linenr, ":set nu!<CR>", silent_opt)
    map("n", misc_map.save_file, ":w <CR>", silent_opt)
    map("n", misc_map.hide_hls, ":nohls <CR>", silent_opt)

    -- region terminal mappings
    map("t", term_maps.esc_termmode, "<C-\\><C-n>", silent_opt)
    map("t", term_maps.esc_hide_termmode, "<C-\\><C-n> :lua require('main.utils').close_buffer() <CR>", silent_opt)
    map("n", term_maps.pick_term, ":Telescope terms <CR>", silent_opt)
    map("n", term_maps.new_horizontal, ":execute 15 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>", silent_opt)
    map("n", term_maps.new_vertical, ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>", silent_opt)
    map("n", term_maps.new_window, ":execute 'terminal' | let b:term_type = 'wind' | startinsert <CR>", silent_opt)
    -- endregion terminal mappings

    cmd "silent! command PackerCompile lua require 'plugins.plugin_list' require('packer').compile()"
    cmd "silent! command PackerInstall lua require 'plugins.plugin_list' require('packer').install()"
    cmd "silent! command PackerStatus lua require 'plugins.plugin_list' require('packer').status()"
    cmd "silent! command PackerSync lua require 'plugins.plugin_list' require('packer').sync()"
    cmd "silent! command PackerUpdate lua require 'plugins.plugin_list' require('packer').update()"
end

-- region plugin_bindings
function bindings.bufferline()
    local m = cfg_bindings.bufferline

    map("n", m.new_buffer, ":enew<CR>", silent_opt) -- new buffer
    map("n", m.newtab, ":tabnew<CR>", silent_opt) -- new tab
    map("n", m.close, ":lua require('main.utils').close_buffer() <CR>", silent_opt) 

    map("n", m.cycleNext, ":BufferLineCycleNext<CR>", silent_opt)
    map("n", m.cyclePrev, ":BufferLineCyclePrev<CR>", silent_opt)
end

function bindings.neoformat() 
    local m = cfg_bindings.neoformat.format
    map("n", m, ":Neoformat<CR>",silent_opt)
end

function bindings.comment_nvim()
    local m = cfg_bindings.comment_nvim.comment_toggle

    map("n", m, ":CommentToggle<CR>", silent_opt)
    map("v", m, ":CommentToggle<CR>", silent_opt)
end

function bindings.fugitive()
    local m = cfg_bindings.fugitive

    map("n", m.Git, ":Git<CR>", silent_opt)
    map("n", m.diffget_2, ":diffget //2<CR>", silent_opt)
    map("n", m.diffget_3, ":diffget //3<CR>", silent_opt)
    map("n", m.git_blame, ":Git blame<CR>", silent_opt)
end

function bindings.nvimtree()
    local m = cfg_bindings.nvimtree

    map("n", m.treetoggle, ":NvimTreeToggle<CR>", silent_opt)
    map("n", m.treefindfile, ":NvimTreeFindFile<CR>", silent_opt)
end

function bindings.truezen()
    local m = cfg_bindings.truezen

    map("n", m.ataraxisMode, ":TZAtaraxis<CR>", silent_opt)
    map("n", m.minimalisticmode, ":TZMinimalist<CR>", silent_opt)
    map("n", m.focusmode, ":TZFocus<CR>", silent_opt)
end

function bindings.telescope()
    local m = cfg_bindings.telescope

    map("n", m.live_grep, ":Telescope live_grep<CR>", silent_opt)
    map("n", m.git_status, ":Telescope git_status <CR>", silent_opt)
    map("n", m.git_commits, ":Telescope git_commits <CR>", silent_opt)
    map("n", m.find_files, ":Telescope find_files <CR>", silent_opt)
    map("n", m.buffers, ":Telescope buffers<CR>", silent_opt)
    map("n", m.help_tags, ":Telescope help_tags<CR>", silent_opt)
    map("n", m.oldfiles, ":Telescope oldfiles<CR>", silent_opt)
end

-- endregion plugin_bindings

return bindings
