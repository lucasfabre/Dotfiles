-- Imports
pcall(require, "luarocks.loader")

local gears                = require("gears")
local awful                = require("awful")
local wibox                = require("wibox")
local beautiful            = require("beautiful")
local naughty              = require("naughty")
local menubar              = require("menubar")
local hotkeys_popup        = require("awful.hotkeys_popup")
local has_fdo, freedesktop = pcall(require, "freedesktop")
local myawesomemenu        = require("menu/menu")
local default_apps         = require("prefs/default_apps")

-- Load the theme
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

require("awful.hotkeys_popup.keys")
require("awful.autofocus")
require("utils/error_handling")
require("prefs/wallpaper")
require("bindings/mouse")
require("bindings/keyboard")
require("clients/rules")
require("clients/signals")
require("panel/taskbar")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    -- awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "1" }, s, awful.layout.layouts[1])
end)

