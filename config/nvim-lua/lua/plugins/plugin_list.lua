local present, _ = pcall(require, "plugins.packer_init")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use
local plugin_status = require("main.utils").load_config().plugin_status

return packer.startup(function()
    use {
        "wbthomason/packer.nvim",
        event = "VimEnter",
    }

    use {
        "glepnir/galaxyline.nvim",
        disable = not plugin_status.galaxyline,
        after = "nvim-web-devicons",
        config = function()
            require("plugins.configs.galaxyline")
        end,
    }

    use {
        "akinsho/bufferline.nvim",
        disable = not plugin_status.nvim_bufferline,
        config = function()
            require("plugins.configs.bufferline")
        end,
        setup = function()
            require("main.bindings").bufferline()
        end,
    }

    -- color related stuff
    use {
        "NLKNguyen/papercolor-theme",
        cmd = {
            "Git",
        },
    }
    use {
        "norcalli/nvim-colorizer.lua",
        disable = not plugin_status.nvim_colorizer,
        event = "BufRead",
        config = function()
            require("plugins.configs.others").colorizer()
        end,
    }

    -- lsp stuff
    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require("plugins.configs.treesitter")
        end,
    }

    use {
        "kabouzeid/nvim-lspinstall",
        event = "BufRead",
    }

    use {
        "neovim/nvim-lspconfig",
        after = "nvim-lspinstall",
        config = function()
            require("plugins.configs.lspconfig")
        end,
    }

    use {
        "onsails/lspkind-nvim",
        disable = not plugin_status.lspkind,
        event = "BufEnter",
        config = function()
            require("plugins.configs.others").lspkind()
        end,
    }

    use {
        "ray-x/lsp_signature.nvim",
        disable = not plugin_status.lspsignature,
        after = "nvim-lspconfig",
        config = function()
            require("plugins.configs.others").signature()
        end,
    }

    -- load compe in insert mode only
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("plugins.configs.compe")
        end,
        wants = "LuaSnip",
        requires = {
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                event = "InsertCharPre",
                config = function()
                    require("plugins.configs.luasnip")
                end,
            },
            {
                "rafamadriz/friendly-snippets",
                event = "InsertCharPre",
            },
        },
    }

    use {
        "sbdchd/neoformat",
        disable = not plugin_status.neoformat,
        cmd = "Neoformat",
        setup = function()
            require("main.bindings").neoformat()
        end,
    }

    -- file managing , picker etc
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("plugins.configs.nvimtree")
        end,
        setup = function()
            require("main.bindings").nvimtree()
        end,
    }

    use {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins.configs.icons")
        end,
    }

    use {
        "nvim-lua/plenary.nvim",
        after = "bufferline.nvim",
    }

    use {
        "nvim-telescope/telescope.nvim",
        after = "plenary.nvim",
        requires = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            },
        },
        config = function()
            require("plugins.configs.telescope")
        end,
        setup = function()
            require("main.bindings").telescope()
        end,
    }

    -- misc plugins.configs
    use {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require("plugins.configs.autopairs")
        end,
    }

    use {
        "andymass/vim-matchup",
        disable = not plugin_status.vim_matchup,
        event = "CursorMoved",
    }

    use {
        "terrortylor/nvim-comment",
        disable = not plugin_status.nvim_comment,
        cmd = "CommentToggle",
        config = function()
            require("plugins.configs.others").comment()
        end,
        setup = function()
            require("main.bindings").comment_nvim()
        end,
    }

    use {
        "Pocco81/TrueZen.nvim",
        disable = not plugin_status.truezen_nvim,
        cmd = {
            "TZAtaraxis",
            "TZMinimalist",
            "TZFocus",
        },
        config = function()
            require("plugins.configs.truezen")
        end,
        setup = function()
            require("main.bindings").truezen()
        end,
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        disable = not plugin_status.blankline,
        event = "BufRead",
        setup = function()
            require("plugins.configs.others").blankline()
        end,
    }

    use {
        "tpope/vim-fugitive",
        disable = not plugin_status.vim_fugitive,
        cmd = {
            "Git",
        },
        setup = function()
            require("main.bindings").fugitive()
        end,
    }
end)