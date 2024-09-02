-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Darkside (Gogh)'
config.font_size = 14.0
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_decorations = "TITLE | RESIZE"

-- and finally, return the configuration to wezterm
return config
