local wezterm = require("wezterm")
wezterm.on("update-status", function(window, pane)
  window:set_right_status(window:active_workspace())
end)

return {
  font = wezterm.font("Fira Code"),
  font_size = 11.0,
  animation_fps = 1,
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",
  cursor_blink_rate = 0,
  color_scheme = "Sonokai (Gogh)",
  adjust_window_size_when_changing_font_size = false,
  selection_word_boundary = " \t\n{}[]()\"'`,;:│=&!%",
  hide_tab_bar_if_only_one_tab = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  native_macos_fullscreen_mode = true,
  window_background_opacity = 0.95,
}
