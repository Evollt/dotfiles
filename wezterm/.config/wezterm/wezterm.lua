-- Pull in wezterm API
local wezterm = require("wezterm")

-- This will hold configuration
local config = wezterm.config_builder()

config.font = wezterm.font("JetbrainsMono Nerd Font")
config.font_size = 14
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.3
config.macos_window_background_blur = 15

config.color_scheme = "One Dark (iTerm2)"

config.colors = {
	cursor_bg = "#ffffff",
	cursor_fg = "#ffffff",
	cursor_border = "#ffffff",
	selection_bg = "rgba(138, 138, 138, 0.5)",
}

-- keep adding configuration options here
return config
