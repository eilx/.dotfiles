local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.term = 'wezterm'
config.front_end = 'WebGpu'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.initial_rows = 30
config.initial_cols = 120

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_background_opacity = 0.9
config.color_scheme = wezterm.gui.get_appearance():find('Dark')
	and "rose-pine"
	or "rose-pine-dawn"

config.underline_position = -3
config.line_height = 1.1
config.font_size = 9
config.font = wezterm.font_with_fallback {
	'JetBrains Mono', 'Symbols Nerd Font', 'Noto Color Emoji'
}

return config
