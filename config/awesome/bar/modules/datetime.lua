local M = {}

function M.setup()
    return wibox.widget {
        widget = wibox.widget.textclock()
    }
end

return M
