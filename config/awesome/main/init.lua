require("awful.autofocus")

-- Get naughty and basic error handling of awesome
require("main.error_handling")

-- Include and define awesome wm rules
--   Bindings are managed by rules
require("main.rules")

-- Define callers defined and managed by awesome
require("main.signals")
