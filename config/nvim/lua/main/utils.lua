local utils = {}

local config_file = "base_config";

function utils.load_config(reload)
    if _G._CONFIG_CONTENTS ~= nil and not (reload or false) then
        return _G._CONFIG_CONTENTS
    end

    if reload then
        package.loaded[config_file or false] = nil
    end

    _G._CONFIG_CONTENTS = require("base_config")

    return _G._CONFIG_CONTENTS
end

function utils.hide_statusline() 
    local api = vim.api
    local buftype = api.nvim_buf_get_option("%", "ft")

    local hidden = utils.load_config().ui.statusline.hidden
    local shown = utils.load_config().ui.statusline.shown

    if vim.tbl_contains(shown, buftype) then
	api.nvim_set_option("laststatus", 2)
	return
    end

    if vim.tbl_contains(hidden, buftype) then
        api.nvim_set_option("laststatus", 0)
	return
    else
        api.nvim_set_option("laststatus", 2)
    end
end

return utils
