local wezterm = require("wezterm")
local act = wezterm.action

return {

  -- 左右分割
  {
    key = "|",
    mods = "LEADER|SHIFT",
    action = act.SplitHorizontal({
      domain = "CurrentPaneDomain",
    }),
  },

  -- 上下分割
  {
    key = "-",
    mods = "LEADER",
    action = act.SplitVertical({
      domain = "CurrentPaneDomain",
    }),
  },

  -- ペイン移動
  {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left"),
  },

  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down"),
  },

  {
    key = "k",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up"),
  },

  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right"),
  },

  -- ペイン最大化
  {
    key = "z",
    mods = "LEADER",
    action = act.TogglePaneZoomState,
  },

  -- ペインを閉じる
  {
    key = "x",
    mods = "LEADER",
    action = act.CloseCurrentPane({
      confirm = true,
    }),
  },

  -- 新しいタブ
  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnTab("CurrentPaneDomain"),
  },

  -- 次のタブ
  {
    key = "n",
    mods = "LEADER",
    action = act.ActivateTabRelative(1),
  },

  -- 前のタブ
  {
    key = "p",
    mods = "LEADER",
    action = act.ActivateTabRelative(-1),
  },

  -- Copy Mode
  {
    key = "[",
    mods = "LEADER",
    action = act.ActivateCopyMode,
  },
}