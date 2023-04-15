local M = {}

M.ui = {
  -- theme options
  theme = "one",
  background = "dark",

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
  }
}

return M
