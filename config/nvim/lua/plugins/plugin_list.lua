local present, _ = pcall(require, "plugins.packer_init")
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
        "hoob3rt/lualine.nvim",
        config = function()
            require("plugins.configs.statusline")
        end,
    }

    -- color related stuff
    use {
        "rakr/vim-one",
    }

    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("plugins.configs.others").colorizer()
        end,
    }

    -- lsp stuff
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.configs.lspconfig")
        end,
    }

    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("plugins.configs.others").signature()
        end
    }

    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.configs.cmp")
        end
    }

    use {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter",
    }

    use {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function()
            require("plugins.configs.others").luasnip()
        end,
    }

    use {
        "saadparwaiz1/cmp_luasnip",
        after = "LuaSnip",
    }

    use {
        "hrsh7th/cmp-nvim-lua",
        after = "cmp_luasnip",
    }

    use {
        "hrsh7th/cmp-nvim-lsp",
        after = "cmp-nvim-lua",
    }

    use {                                                                               
        "akinsho/bufferline.nvim",                                                      
        config = function()                                                             
            require("plugins.configs.bufferline")                                       
        end,                                                                            
    }                                                                                   
        

    use {
        "hrsh7th/cmp-buffer",
        after = "cmp-nvim-lsp",
    }

    -- file managing , picker etc
    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require("plugins.configs.treesitter")
        end,
    }

    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("plugins.configs.nvimtree")
        end,
        setup = function()
            require("main.bindings").nvimtree()
        end,
    }

    use {
        "kyazdani42/nvim-web-devicons",
    }

    use {
        "nvim-lua/plenary.nvim",
    }

    use {
	"windwp/nvim-autopairs",
	config = function()
	    require("plugins.configs.nvim_autopairs")
	end,
	setup = function() 
	end
    }

    use {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require("plugins.configs.telescope")
        end,
        setup = function()
            require("main.bindings").telescope()
        end,
    }

    -- misc plugins.configs
    use {
        "andymass/vim-matchup",
        event = "CursorMoved",
    }

    use {
        "terrortylor/nvim-comment",
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
	event = "BufRead",
        config = function()
            require("plugins.configs.others").blankline()
        end,
    }

    use {
        "tpope/vim-fugitive",
        cmd = {
            "Git",
            "Gdiff",
            "Gdiffsplit",
            "Gvdiffsplit",
            "Gwrite",
            "Gw",
        },
        setup = function()
            require("main.bindings").fugitive()
        end,
    }
end)
