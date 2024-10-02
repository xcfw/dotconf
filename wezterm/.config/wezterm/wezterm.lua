-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Create the configuration
local config = wezterm.config_builder()

-- General Settings
config.enable_tab_bar = false -- Hide the tab bar since we're using tmux or similar tools
config.use_fancy_tab_bar = false -- Disable fancy tab bar animations if tab bar is hidden
config.hide_mouse_cursor_when_typing = true -- Hide the cursor when typing for a cleaner look

-- Font Settings
config.font = wezterm.font("BlexMono Nerd Font") -- Set the font to BlexMono Nerd Font
config.font_size = 13.0 -- Adjust the font size for the 14" screen (tweak as needed)
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" } -- Enable font ligatures for better typography

-- Color Scheme and Opacity'
-- 'config.colors = require("cyberdream")
config.color_scheme = "Synthwave (Gogh)" -- Set a vibrant color scheme
config.window_background_opacity = 0.88 -- Set the background opacity for a transparent look

-- GPU Acceleration and Rendering
config.front_end = "OpenGL" -- Enable GPU acceleration with OpenGL for smooth rendering
config.enable_scroll_bar = false -- Disable the scroll bar to maximize space and keep the UI clean

-- Window and UI Settings
config.window_decorations = "RESIZE" -- Keep minimal window decorations (only resize borders)
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
} -- Add padding to avoid text touching the edges

-- Scrollback and Performance
config.scrollback_lines = 5000 -- Increase scrollback buffer for more history
config.use_dead_keys = false -- Disable dead keys to improve performance for typing accents

-- Advanced Rendering Effects
config.macos_window_background_blur = 10 -- Apply a background blur effect for macOS
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
} -- Dim inactive panes to focus on the active pane

-- Retro CRT Effects
-- Note: WezTerm does not natively support scanlines and CRT distortions, but we can simulate some effects

-- Function to add scanline effect
local function apply_scanlines()
	-- Example scanline effect by adjusting brightness and contrast
	return {
		{
			brightness = 0.9,
			contrast = 1.1,
		},
		{
			brightness = 0.85,
			contrast = 1.15,
		},
	}
end

-- Apply scanline effect (this is illustrative; WezTerm may not support all effects)
-- config.apply_scanlines = apply_scanlines

-- Function to add CRT distortion
local function apply_crt_distortion()
	-- Example CRT distortion effect by simulating a slight blur and color shift
	return {
		{
			blur = 0.6,
			color_shift = { r = 0.2, g = 0.1, b = 0.2 },
		},
		{
			blur = 0.4,
			color_shift = { r = 0.08, g = 0.05, b = 0.05 },
		},
	}
end

-- Apply CRT distortion (this is illustrative; WezTerm may not support all effects)
-- config.apply_crt_distortion = apply_crt_distortion

-- Keybindings and Shortcuts
config.keys = {
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment }, -- Prevent ALT+Enter from maximizing the window
}

-- Finally, return the configuration
return config
