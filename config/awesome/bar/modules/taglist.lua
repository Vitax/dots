local M = {}

local taglist_buttons = gears.table.join(
    awful.button({ }, 1,
	function(t)
	    t:view_only()
	end),
    awful.button({ Super }, 1,
	function(t)
	    if client.focus then
		client.focus:move_to_tag(t)
	    end
	end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ Super }, 3,
	function(t)
	    if client.focus then
		client.focus:toggle_tag(t)
	    end
	end),
    awful.button({ }, 4,
	function(t)
	    awful.tag.viewnext(t.screen)
	end),
    awful.button({ }, 5,
	function(t)
	    awful.tag.viewprev(t.screen)
	end)
)

function M.setup(s)
    return awful.widget.taglist {
		screen  = s,
		filter  = awful.widget.taglist.filter.noempty,
		layout   = {
			spacing = 2,
			layout  = wibox.layout.fixed.horizontal
		},
		widget_template = {
			{
				{
					{
						{
							id = 'index_role',
							widget = wibox.widget.textbox,
						},
						widget = wibox.container.background,
					},
					{
						id = 'text_role',
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left  = 8,
				right = 8,
				widget = wibox.container.margin
			},
			id  = 'background_role',
			widget = wibox.container.background,
		},
		buttons = taglist_buttons
    }
end

return M
