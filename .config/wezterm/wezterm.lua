local wezterm = require 'wezterm'
local font = wezterm.font
local action = wezterm.action
local config = wezterm.config_builder()

-- Fonts
config.font = font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 14.0

-- Scrollback
config.scrollback_lines = 10000

-- Bell
config.audible_bell = 'Disabled'

-- UI
config.enable_scroll_bar = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.default_cursor_style = 'SteadyBlock'
config.initial_cols = 120
config.initial_rows = 36
config.window_decorations = 'RESIZE'

config.skip_close_confirmation_for_processes_named = {
  'bash',
  'sh',
  'zsh',
  'fish',
  'tmux',
}

-- Perf
config.max_fps = 120

-- Auto config reload
config.automatically_reload_config = true

-- Keys
config.keys = {
  {
    key = 'p',
    mods = 'CMD',
    action = action.ActivateCommandPalette,
  },
  {
    key = '|',
    mods = 'CMD',
    action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '\\',
    mods = 'CMD',
    action = action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = action.CloseCurrentPane { confirm = true },
  },
  {
    key = '`',
    mods = 'CMD',
    action = action.PaneSelect {
      alphabet = '1234567890',
    }
  },
  { key = 'UpArrow', mods = 'CMD', action = action.ScrollToPrompt(-1) },
  { key = 'DownArrow', mods = 'CMD', action = action.ScrollToPrompt(1) },
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 3, button = 'Left' } },
    action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
    mods = 'NONE',
  },
}

return config
