local wezterm = require("wezterm")

local M = {}

function M.apply(config)

  ----------------------------------------------------
  -- 基本
  ----------------------------------------------------
  config.font = wezterm.font("JetBrainsMono Nerd Font")
  config.font_size = 12.0
  config.use_ime = true

  ----------------------------------------------------
  -- 背景
  ----------------------------------------------------

  -- 記事と同じ透明度
  config.window_background_opacity = 0.85

  -- Windows版のぼかし
  -- 記事では macOS用の blur = 20
  config.win32_system_backdrop = "Disable"

  ----------------------------------------------------
  -- ウィンドウ
  ----------------------------------------------------

  -- タイトルバーを非表示
  config.window_decorations = "RESIZE"

  ----------------------------------------------------
  -- タブ
  ----------------------------------------------------

  -- タブバー表示
  config.show_tabs_in_tab_bar = true

  -- タブが1個だけなら非表示
  config.hide_tab_bar_if_only_one_tab = true

  -- fancy tab barは有効のまま
  -- 記事でもfalseにはしていない
  -- config.use_fancy_tab_bar = false

  -- タブバー透過
  config.window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
  }

  -- 背景色
  config.window_background_gradient = {
    colors = { "#000000" },
  }

  -- ＋ボタンを非表示
  config.show_new_tab_button_in_tab_bar = false

  -- タブ境界線を非表示
  config.colors = {
    tab_bar = {
      inactive_tab_edge = "none",
    },
  }

  ----------------------------------------------------
  -- その他
  ----------------------------------------------------

  config.audible_bell = "Disabled"

end

----------------------------------------------------
-- タブデザイン
----------------------------------------------------

local SOLID_LEFT_ARROW =
  wezterm.nerdfonts.ple_lower_right_triangle

local SOLID_RIGHT_ARROW =
  wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on(
  "format-tab-title",
  function(tab, tabs, panes, config, hover, max_width)

    -- 非アクティブ
    local background = "#5c6d74"
    local foreground = "#FFFFFF"

    local edge_background = "none"

    -- アクティブ
    if tab.is_active then
      background = "#ae8b2d"
      foreground = "#FFFFFF"
    end

    local edge_foreground = background

    local title =
      "   "
      .. wezterm.truncate_right(
        tab.active_pane.title,
        max_width - 1
      )
      .. "   "

    return {
      {
        Background = {
          Color = edge_background,
        },
      },

      {
        Foreground = {
          Color = edge_foreground,
        },
      },

      {
        Text = SOLID_LEFT_ARROW,
      },

      {
        Background = {
          Color = background,
        },
      },

      {
        Foreground = {
          Color = foreground,
        },
      },

      {
        Text = title,
      },

      {
        Background = {
          Color = edge_background,
        },
      },

      {
        Foreground = {
          Color = edge_foreground,
        },
      },

      {
        Text = SOLID_RIGHT_ARROW,
      },
    }
  end
)

return M