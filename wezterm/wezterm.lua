-- https://blog.csdn.net/gitblog_00620/article/details/151128816
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 16
-- AdventureTime | Batman | Catppuccin | Dracula | GitHub Dark
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font_with_fallback({
      'Iosevka Nerd Font Mono',
      'LXGW WenKai Mono Medium',
      'JetBrains Mono',
      'Fire Code',
      '华文仿宋',
      'Microsoft YaHei'
})

-- key binds

wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

-- window background Opacity
config.window_background_opacity = 0.75
config.text_background_opacity = 0.7
config.macos_window_background_blur = 30

-- GPU
config.front_end="WebGpu"
config.animation_fps=60
config.max_fps=60
config.scrollback_lines=10000

-- Memory
config.audible_bell = "SystemBeep"
config.visual_bell = {
   fade_in_function = "EaseIn",
   fade_in_duration_ms = 150,
   fade_out_function = "EaseOut",
   fade_out_duration_ms = 150,
}

-- Finally, return the configuration to wezterm:
return config
