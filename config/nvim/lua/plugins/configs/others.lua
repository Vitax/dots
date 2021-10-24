local others = {}

function others.colorizer()
   local present, colorizer = pcall(require, "colorizer")
   if present then
      colorizer.setup()
      vim.cmd "ColorizerReloadAllBuffers"
   end
end

function others.comment()
   local present, nvim_comment = pcall(require, "nvim_comment")
   if present then
      nvim_comment.setup()
   end
end

function others.luasnip()
   local present, luasnip = pcall(require, "luasnip")
   if not present then
      return
   end

   luasnip.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
   }
   require("luasnip/loaders/from_vscode").load()
end

function others.blankline()
   vim.g.indentLine_enabled = 1
   vim.g.indent_blankline_char = "▏"

   vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "packer" }
   vim.g.indent_blankline_buftype_exclude = { "terminal" }

   vim.g.indent_blankline_show_trailing_blankline_indent = false
   vim.g.indent_blankline_show_first_indent_level = false
end

function others.signature()
   local present, lspsignature = pcall(require, "lsp_signature")
   if present then
      lspsignature.setup {
         bind = true,
         doc_lines = 2,
         floating_window = true,
         fix_pos = true,
         hint_enable = true,
         hint_prefix = " ",
         hint_scheme = "String",
         hi_parameter = "Search",
         max_height = 22,
         max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
         handler_opts = {
            border = "single", -- double, single, shadow, none
         },
         zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
         padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
      }
   end
end

return others
