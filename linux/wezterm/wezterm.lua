-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Color scheme, refer to https://wezterm.org/colorschemes/index.html
config.color_scheme = "Monokai (dark) (terminal.sexy)"

-- Font settings
-- cd ~/Downlods && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
config.font = wezterm.font("JetBrainsMono Nerd Font", { bold = true, italic = false })
config.font_size = 12

-- Window padding settings
config.window_padding = {
	left = 16,
	right = 16,
	top = 16,
	bottom = 16,
}

-- Hide tab bar if only one tab is open
-- config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
-- Disable tab bar
-- config.enable_tab_bar = false
config.tab_bar_at_bottom = true

-- Set window background opacity
config.window_background_opacity = 0.8

-- Initial window size
config.initial_rows = 32
config.initial_cols = 120

-- Finally, return the configuration to wezterm
return config
