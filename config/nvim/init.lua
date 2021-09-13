local modules = {
    "main",
}

for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)

    if not ok then
        error("Error while importing " .. module .. "\n\n" .. err)
    end
end

