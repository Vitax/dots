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
        close = "<leader>Q",
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
        save_file = "<leader>w",
        close_buffer = "<leader>q",
        esc_termmode = "jk",
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
        themes = "<leader>th",
    },
    terms = {
        esc_termmode = "jk",
        esc_hide_termmode = "JK",
        pick_term = "<leader>W",
        new_wind = "<leader>w",
        new_vert = "<leader>v",
        new_hori = "<leader>h",
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
