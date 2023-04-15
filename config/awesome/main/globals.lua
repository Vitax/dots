local M = {}

-- This is used later as the default terminal and editor to run.
M.vars = {
    terminal = "kitty",
    editor = os.getenv("EDITOR") or "nvim",
    launcher = "rofi -show drun -theme launcher"
}

M.keys =  {
    Super = "Mod4",
    Alt = "Mod1"
}

return M
