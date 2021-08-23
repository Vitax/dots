local base = {}

base.ui = {
    -- theme options
    theme = "PaperColor",
    background = "light",

    -- font options
    italic_comments = false,

    -- statusline options
    statusline = {
        hidden = {
            "NvimTree",
            "terminal",
        },
        shown = {},
        style = "round",
    },
}

base.options = {
    auto_save = false,
    permanent_undo = true,

    hidden = true,
    ruler = false,
    ignorecase = true,
    smartcase = true,
    mouse = "",
    cmdheight = 1,
    updatetime = 300,
    timeoutlen = 400,
    clipboard = "unnamedplus",

    number = true,
    relativenumber = false,

    numberwidth = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,

    mapleader = ",",
}

base.bindings = {
    bufferline = {
        new_buffer = "<S-t>",
        newtab = "<C-t>b",
        close = "<leader>q",
        cycleNext = "tk",
        cyclePrev = "tj",
    },
    comment_nvim = {
        comment_toggle = "<C-k>c",
    },
    fugitive = {
        Git = "<leader>gs",
        diffget_2 = "<leader>gh",
        diffget_3 = "<leader>gl",
        git_blame = "<leader>gb",
    },
    misc = {
        alternative_command = ";",
        save_file = "<leader>w",
        close_buffer = "td",
        hide_hls = "<leader><leader>",
        toggle_linenr = "<leader>n",
        theme_toggle = "<leader>tt",
    },
    nvimtree = {
        treetoggle = "<C-k>n",
    },
    neoformat = {
        format = "<C-k><C-d>",
    },
    truezen = {
        ataraxisMode = "<leader>zz",
        minimalisticmode = "<leader>zm",
        focusmode = "<leader>zf",
    },
    telescope = {
        live_grep = "<leader>fw",
        git_status = "<leader>gt",
        git_commits = "<leader>cm",
        find_files = "<leader>ff",
        buffers = "<leader>fb",
        help_tags = "<leader>fh",
        oldfiles = "<leader>fo",
    },
    terminal = {
        esc_termmode = "<C-x><C-c>",
        esc_hide_termmode = "<C-x><C-q>",
        pick_term = "<C-x>t",
        new_window = "<C-x>nt",
        new_vertical = "<C-x>vt",
        new_horizontal = "<C-x>ht",
    },
}

base.plugin_status = {
    -- UI
    nvim_bufferline = true,
    galaxyline = true,
    nvim_colorizer = true,
    blankline = true,
    truezen_nvim = true,

    -- lsp stuff
    lspkind = true,
    lspsignature = true,

    -- git stuff
    gitsigns = true,
    vim_fugitive = true,

    -- misc
    neoformat = true,
    vim_matchup = true,
    nvim_comment = true,
    telescope_media = true,
}

return base
