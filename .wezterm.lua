local wezterm = require 'wezterm'
-- local colors = require("lua/rose-pine-moon").colors()
-- local window_frame = require("lua/rose-pine-moon").window_frame()

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.colors = colors
-- config.window_frame = window_frame

config.color_scheme = 'GruvboxDark'
config.audible_bell = 'Disabled'

config.font = wezterm.font '0xProto Nerd Font Propo'
config.font_size = 14.0
config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = 'RESIZE'

wezterm.plugin.require('https://github.com/nekowinston/wezterm-bar').apply_to_config(config, {
  position = 'bottom',
  max_width = 32,
  dividers = false,
  indicator = {
    leader = {
      enabled = true,
      off = ' ',
      on = ' ',
    },
    mode = {
      enabled = true,
      names = {
        resize_mode = 'RESIZE',
        copy_mode = 'VISUAL',
        search_mode = 'SEARCH',
      },
    },
  },
  tabs = {
    numerals = 'arabic', -- or "roman"
    pane_count = 'superscript', -- or "subscript", false
    brackets = {
      active = { '', ':' },
      inactive = { '', ':' },
    },
  },
  clock = {
    enabled = true, -- note that this overrides the whole set_right_status
    format = '%H:%M', -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
  },
})

config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = 'd',
    mods = 'SUPER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = 'w',
    mods = 'SUPER|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = '[',
    mods = 'SUPER',
    action = wezterm.action.ActivatePaneDirection 'Prev',
  },
  {
    key = ']',
    mods = 'SUPER',
    action = wezterm.action.ActivatePaneDirection 'Next',
  },
  {
    key = 'w',
    mods = 'SUPER',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
}

return config
