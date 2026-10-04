local wezterm = require("wezterm")
local config = wezterm.config_builder()

local keybinds = require("keybinds")
local appearance = require("appearance")

config.automatically_reload_config = true

config.default_prog = {
  "powershell.exe",
  "-NoLogo",
}

config.leader = {
  key = "q",
  mods = "CTRL",
  timeout_milliseconds = 1000,
}

config.keys = keybinds

appearance.apply(config)

return config