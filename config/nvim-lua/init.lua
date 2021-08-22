local modules = {
    "options",
    "bindings",
}

for i = 1, #modules, 1 do
    if not pcall(require, modules[i]) then
        error("Error loading " .. modules[i] .. "\n")
    end
end

require("bindings").misc()

