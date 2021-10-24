local base = {}

base.ui = {
    -- theme options
    theme = "one",
    background = "light",

    -- font options
    italic_comments = true,

    -- statusline options
    statusline = {
        hidden = {
            "NvimTree",
            "terminal",
            "help",
        },
        shown = {},
        style = "round",
    },
}

base.options = {
    auto_save = false,
    permanent_undo = false,

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
        close = "td",
        cycleNext = "tj",
        cyclePrev = "tk",
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
        easy_command = ";",
        easy_open_file = "<C-k>x",
        save_file = "<leader>w",
        close_window = "<leader>q",
        hide_hls = "<leader><leader>",
        toggle_linenr = "<leader>n",
    },
    nvimtree = {
        treetoggle = "<C-k>n",
        treefindfile = "<C-m>f",
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

return base
