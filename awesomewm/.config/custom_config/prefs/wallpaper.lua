local beautiful = require("beautiful")
local gears     = require("gears")
local awful     = require("awful")

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Apply the wallpaper to each screen
awful.screen.connect_for_each_screen(function(s)
   set_wallpaper(s)
end)

