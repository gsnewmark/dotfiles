-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = 'Gruvbox Material (Gogh)'

config.font = wezterm.font('IosevkaTerm Nerd Font', { weight = 'Bold' })
config.font_size = 13.0
config.line_height = 0.8

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'

config.native_macos_fullscreen_mode = true

wezterm.on('gui-attached', function(domain)
    -- maximize all displayed windows on startup
    local workspace = mux.get_active_workspace()
    for _, window in ipairs(mux.all_windows()) do
        if window:get_workspace() == workspace then
            window:gui_window():maximize()
        end
    end
end)

-- and finally, return the configuration to wezterm
return config
