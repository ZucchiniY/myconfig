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

-- 多路复用
config.enable_wayland = true

-- auto save
config.automatically_reload_config = true

-- tabs config
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.status_update_interval = 1000

wezterm.on('update-status', function(window, pane)
              local date = wezterm.strftime('%Y-%m-%d %H:%M:%S')
              window:set_right_status(wezterm.format({
                                            { Foregroud = {Color = '#ffffff'}},
                                            { Backgroud = { Color = '#333333'}},
                                            { Text = ' ' .. date ..' '},
              }))
end)

-- window background Opacity
config.window_background_opacity = 0.75 -- 透明度 0.0 ~ 1.0
config.text_background_opacity = 0.7 -- 文字透明度
config.macos_window_background_blur = 30

-- 背景图
-- config.window_background_image = "/Users/dylan/workspace/myconfig/wezterm/cat.png"
-- config.window_background_image_hsb = {
--    brightness = 0.3, -- 调整亮度 0.0 ~ 1.0
--    hue = 1.0, -- 调整色调 默认值 1.0
--    saturation = 1.0, -- 调整饱和度 默认值 1.0
-- }

-- 渐变背景
config.window_background_gradient = {
   colors = {"#082b41", "#171d1d"}, -- 渐变颜色
   orientation = "Vertical", -- 渐变方向 (Vertical/Horizontal)
}

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
