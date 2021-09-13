local main_modules = {
    "main.autocmds",
    "main.options",
    "main.bindings",
}

for _, module in ipairs(main_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error while importing " .. module .. "\n\n" .. err)
    end
end

require("main.bindings").misc()
