awful = require("awful")
beautiful = require("beautiful")
dpi = beautiful.xresources.apply_dpi
gears = require("gears")
naughty = require("naughty")
wibox = require("wibox")


-- Themes define colours, icons, font and wallpapers.
local themes = {
  "zenburn"
}

-- Intialize selected theme
require("themes/" .. themes[1])

require("main")
