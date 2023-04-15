local battery = require("bar.modules.battery")
local datetime = require("bar.modules.datetime")
local tasklist = require("bar.modules.tasklist")
local taglist = require("bar.modules.taglist")

require("main.layouts")

local function set_wallpaper(s)
  awful.spawn("nitrogen --restore")
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  set_wallpaper(s)

  awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

  s.layoutbox = awful.widget.layoutbox(s)
  s.taglist = taglist.setup(s)
  s.tasklist = tasklist.setup(s)
  s.wibox = awful.wibar({ position = "top", screen = s, height = dpi(40) })

  s.wibox:setup {
    {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        s.taglist,
      },
      {
        layout = wibox.layout.fixed.horizontal,
        s.tasklist, -- Middle widget
      },
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        battery { widget_font = "JetBrainsMono Nerd Font" },
        datetime.setup(),
        wibox.widget.systray(),
        s.layoutbox,
      },
    },
    margins = 4,
    widget = wibox.container.margin
    }
end)
-- }}}
