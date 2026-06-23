-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme: https://wezterm.org/colorschemes/index.html
config.color_scheme = "neobones_dark"
-- config.color_scheme = "Solarized (light) (terminal.sexy)"

-- Font settings
config.font = wezterm.font("JetbrainsMonoNL Nerd Font", { bold = true, italic = false })
config.font_size = 12

-- Window padding settings
config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}

-- Hide tab bar if only one tab is open
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.tab_bar_at_bottom = true

-- Initial window size
config.initial_rows = 40
config.initial_cols = 120

-- Linux specific settings

config.window_decorations = "NONE"

-- MacOS specific settings

-- Enable macOS native fullscreen mode
-- config.native_macos_fullscreen_mode = true

-- config.window_decorations = "RESIZE"

-- Key bindings
-- config.keys = {
-- 	{
-- 		key = "w",
-- 		mods = "CMD",
-- 		action = wezterm.action.CloseCurrentTab({ confirm = false }),
-- 	},
-- 	{
-- 		key = "f",
-- 		mods = "CMD|CTRL",
-- 		action = wezterm.action.ToggleFullScreen,
-- 	},
-- }

-- Finally, return the configuration to wezterm
return config
