lua << EOF
local lualine = require('lualine')

local config = {
}

config.options = {
    theme = 'papercolor_light',
    icons_enabled = true,
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {},
}

config.sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
}

config.inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
}

config.tabline = {}
config.extensions = {}

lualine.setup(config)
EOF
