local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  default_cursor_style = "BlinkingBar",
  color_scheme = 'Gruvbox',
  font = wezterm.font("JetBrains Mono", { weight = "Bold"}),
  font_size = 15,
  background = {
    {
      source = {
        Color = "#222222"
      },
      width = "100%",
      height = "100%",
      opacity = 0.80,
    },
  },
}
return config
