local present, galaxyline = pcall(require,'galaxyline')
local present2, condition = pcall(require, "galaxyline.condition")

-- region helpers
local check_width = function()
   local squeeze_width = vim.fn.winwidth(0) / 2
   if squeeze_width > 30 then
      return true
   end
   return false
end
-- endregion helpers

local papercolor = {
    bg = '#EFEFEF',
    fg = '#282828',
    yellow = '#ECBE7B',
    cyan = '#008080',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    purple = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67',
    grey = '#bbbbbb',
    white = '#efefef',
    statusline_bg = '#efefef'
}

local icon_styles = {
    arrow = {
        left = "",
        right = "",
        vi_mode_icon = " ",
        position_icon = " ",
    },

    block = {
        left = " ",
        right = " ",
        vi_mode_icon = "   ",
        position_icon = "  ",
    },

    round = {
        left = "",
        right = "",
        vi_mode_icon = " ",
        position_icon = " ",
    },

    slant = {
        left = " ",
        right = " ",
        vi_mode_icon = " ",
        position_icon = " ",
    },
}

if not present or not present2 then
    return
end

local user_statusline_style = require("main.utils").load_config().ui.statusline.style
local statusline_style = icon_styles[user_statusline_style]

galaxyline.section.left[1] = {
   first_element = {
      provider = function()
         return "▋"
      end,
      highlight = { papercolor.red, papercolor.red },
   },
}

galaxyline.section.left[2]= {
    file_icon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = {papercolor.fg, papercolor.red},
    }
}

galaxyline.section.left[3]= {
    file_name = {
        provider = 'FileName',
        condition = function()
            if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
                return true
            end
            return false
        end,
        highlight = {papercolor.fg, papercolor.red},
        separator = statusline_style.right,
        separator_highlight = {papercolor.red,papercolor.grey},
    }
}

galaxyline.section.left[4] = {
   DiffAdd = {
      provider = "DiffAdd",
      condition = check_width,
      icon = "  ",
      highlight = { papercolor.fg, papercolor.grey },
   },
}

galaxyline.section.left[5] = {
   DiffModified = {
      provider = "DiffModified",
      condition = check_width,
      icon = "   ",
      highlight = { papercolor.fg, papercolor.grey },
   },
}

galaxyline.section.left[6] = {
   DiffRemove = {
      provider = "DiffRemove",
      condition = check_width,
      icon = "  ",
      highlight = { papercolor.grey, papercolor.grey },
   },
}

galaxyline.section.left[10] = {
   DiagnosticError = {
      provider = "DiagnosticError",
      icon = "  ",
      highlight = { papercolor.red, papercolor.grey },
   },
}

galaxyline.section.left[11] = {
   DiagnosticWarn = {
      provider = "DiagnosticWarn",
      icon = "  ",
      highlight = { papercolor.yellow, papercolor.grey },
   },
}

galaxyline.section.right[1] = {
   lsp_status = {
      provider = function()
         local clients = vim.lsp.get_active_clients()
         if next(clients) ~= nil then
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            for _, client in ipairs(clients) do
               local filetypes = client.config.filetypes
               if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return " " .. "  " .. " LSP"
               end
            end
            return ""
         else
            return ""
         end
      end,
      highlight = { papercolor.fg, papercolor.orange },
   },
}

galaxyline.section.right[2] = {
   GitIcon = {
      provider = function()
         return " "
      end,
      condition = condition.check_git_workspace,
      highlight = { papercolor.fg, papercolor.cyan },
      separator = statusline_style.left,
      separator_highlight = { papercolor.cyan, papercolor.grey },
   },
}

galaxyline.section.right[3] = {
   GitBranch = {
      provider = "GitBranch",
      condition = condition.check_git_workspace,
      highlight = { papercolor.fg, papercolor.cyan },
   },
}

local mode_colors = {
   [110] = { "NORMAL", papercolor.red },
   [105] = { "INSERT", papercolor.purple },
   [99] = { "COMMAND", papercolor.purple },
   [116] = { "TERMINAL", papercolor.green },
   [118] = { "VISUAL", papercolor.cyan },
   [22] = { "V-BLOCK", papercolor.cyan },
   [86] = { "V_LINE", papercolor.cyan },
   [82] = { "REPLACE", papercolor.orange },
   [115] = { "SELECT", papercolor.grey },
   [83] = { "S-LINE", papercolor.grey },
}

local mode = function(n)
   return mode_colors[vim.fn.mode():byte()][n]
end
