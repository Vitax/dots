local M = {}

function M.readfile(command)
    local file = io.open(command)
    if not file then return nil end
    local text = file:read('*all')
    file:close()
    return text
end

function M.color_tags(color)
    if color
        then return '<span color="' .. color .. '">', '</span>'
        else return '', ''
    end
end

function M.round(value)
    return math.floor(value + 0.5)
end

function M.trim(s)
    if not s then return nil end
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function M.read_trim(filename)
    return M.trim(M.readfile(filename)) or ""
end

function M.substitute(template, context)
    if type(template) == "string" then
        return (template:gsub("%${([%w_]+)}", function(key)
            return tostring(context[key] or "Err!")
        end))
    else
        -- function / functor:
        return template(context)
    end
end

function M.lookup_by_limits(limits, value)
    if type(limits) == "table" then
        local last = nil
        if value then
            for k, v in ipairs(limits) do
                if (value <= v[1]) then
                    return v[2]
                end
                last = v[2]
            end
        end
        return last
    else
        return limits
    end
end

return M

