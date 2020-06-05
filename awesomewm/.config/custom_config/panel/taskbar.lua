local awful     = require("awful")
local wibox     = require("wibox")
local beautiful = require("beautiful")
local gears     = require("gears")

local tasklist_buttons = gears.table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                {raise = true}
            )
        end
    end),
    awful.button({ }, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({ }, 4, function ()
        awful.client.focus.byidx(1)
    end),
    awful.button({ }, 5, function ()
        awful.client.focus.byidx(-1)
    end))


local function get_tasklist_for_tag(s, tag)
    return awful.widget.tasklist {
        screen  = s,
        filter  = function(c, s)
            -- Get tag for client
            local t = c.focus and c.focus.first_tag or nil
            return t ~= nil and t == tag
        end,
        buttons = tasklist_buttons,
    }
end

local function get_tasklists_for_screen(s)
    local tasklists = {}
    --for _, t in ipairs(s.tags) do
    --    gears.table.join(tasklists,
    --        get_tasklist_for_tag(s, t)
    --    )
    end
    return nil
end

awful.screen.connect_for_each_screen(function(s)
    s.mywibox = awful.wibar({ position = "bottom", screen = s })

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        -- TagList
        awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.all,
            buttons = taglist_buttons
        },
        -- Tasks For A Specific screen
        get_tasklists_for_screen(s),
      }

end)

