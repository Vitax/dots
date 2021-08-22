local plugin_status = require("utils").load_config().plugin_status

local present, _ = pcall(require, "packer_init")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

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
            require("plugins.galaxyline")
        end,
    }

    use {
        "akinsho/bufferline.nvim",
        disable = not plugin_status.nvim_bufferline,
        config = function()
            require("plugins.bufferline")
        end,
        setup = function()
            require("bindings").bufferline()
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
            require("plugins.others").colorizer()
        end,
    }

    -- lsp stuff
    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require("plugins.treesitter")
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
            require("plugins.lspconfig")
        end,
    }

    use {
        "onsails/lspkind-nvim",
        disable = not plugin_status.lspkind,
        event = "BufEnter",
        config = function()
            require("plugins.others").lspkind()
        end,
    }

    use {
        "ray-x/lsp_signature.nvim",
        disable = not plugin_status.lspsignature,
        after = "nvim-lspconfig",
        config = function()
            require("plugins.others").signature()
        end,
    }

    -- load compe in insert mode only
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("plugins.compe")
        end,
        wants = "LuaSnip",
        requires = {
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                event = "InsertCharPre",
                config = function()
                    require("plugins.luasnip")
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
            require("bindings").neoformat()
        end,
    }

    -- file managing , picker etc
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("plugins.nvimtree")
        end,
        setup = function()
            require("bindings").nvimtree()
        end,
    }

    use {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins.icons")
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
            require("plugins.telescope")
        end,
        setup = function()
            require("bindings").telescope()
        end,
    }

    -- misc plugins
    use {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require("plugins.autopairs")
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
            require("plugins.others").comment()
        end,
        setup = function()
            require("bindings").comment_nvim()
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
            require("plugins.truezen")
        end,
        setup = function()
            require("bindings").truezen()
        end,
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        disable = not plugin_status.blankline,
        event = "BufRead",
        setup = function()
            require("plugins.others").blankline()
        end,
    }

    use {
        "tpope/vim-fugitive",
        disable = not plugin_status.vim_fugitive,
        cmd = {
            "Git",
        },
        setup = function()
            require("bindings").fugitive()
        end,
    }
end)
