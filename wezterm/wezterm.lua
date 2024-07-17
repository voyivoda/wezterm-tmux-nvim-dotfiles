local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
local keys = {}
local mouse_bindings = {}
local haswork, work = pcall(require, "work")

config.initial_rows = 24
config.initial_cols = 80

config.color_scheme = "Catppuccin Macchiato"

config.keys = {
	{
		key = "]",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}
-- Mousing bindings
mouse_bindings = {
	-- Change the default click behavior so that it only selects
	-- text and doesn't open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},

	-- and make CTRL-Click open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
	{
		event = { Down = { streak = 3, button = "Left" } },
		action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
		mods = "NONE",
	},
}

config.window_decorations = "RESIZE"

config.window_padding = {
	left = 30,
	right = 30,
	top = 15,
	bottom = 10,
}
--- Default config settings
config.scrollback_lines = 7000
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.hide_tab_bar_if_only_one_tab = true
--- config.color_scheme = 'AdventureTime'
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrains Mono",
	},
	{
		family = "IosevkaTerm NFM",
	},
	{
		family = "Hack Nerd Font",
	},
})
config.font_size = 18
config.default_cursor_style = "BlinkingBar"
config.keys = keys
config.mouse_bindings = mouse_bindings

--- Display
config.window_background_opacity = 0.8

-- Allow overwriting for work stuff
if haswork then
	work.apply_to_config(config)
end

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config
