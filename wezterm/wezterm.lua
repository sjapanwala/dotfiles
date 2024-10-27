local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  default_cursor_style = "BlinkingBar",
  color_scheme = 'tokyonight_night',
  font = wezterm.font("JetBrains Mono", { weight = "Bold"}),
  macos_window_background_blur = 20,
  font_size = 18,
  background = {
    {
      source = {
        Color = "#282c35"
      },
      width = "100%",
      height = "100%",
      opacity = 0.85,
    },
  },
}
return config
