local wezterm = require("wezterm")

local config = {}

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.line_height = 1.2
config.font_size = 12
config.color_scheme = "Catppuccin Mocha"
config.force_reverse_video_cursor = true
config.window_background_opacity = 0.8
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}
config.window_close_confirmation = "NeverPrompt"
config.hide_mouse_cursor_when_typing = false
config.tab_bar_at_bottom = true

return config
