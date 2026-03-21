-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Monokai (dark) (terminal.sexy)"
-- config.color_scheme = "flexoki-light"

-- Font settings
config.font = wezterm.font("JetbrainsMono Nerd Font", { bold = true, italic = false })
config.font_size = 15

-- Window padding settings
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Hide tab bar if only one tab is open
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
-- Disable tab bar
-- config.enable_tab_bar = false
config.tab_bar_at_bottom = true

-- Set window background opacity
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

-- Window decoration options
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_decorations = "RESIZE"

-- Disable window close confirmation
config.window_close_confirmation = "NeverPrompt"

-- Initial window size
config.initial_rows = 40
config.initial_cols = 120

-- Enable macOS native fullscreen mode
config.native_macos_fullscreen_mode = true

-- Key bindings
config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "f",
		mods = "CMD|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- Finally, return the configuration to wezterm
return config
