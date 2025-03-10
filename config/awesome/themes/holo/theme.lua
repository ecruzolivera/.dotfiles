local dpi = require("beautiful.xresources").apply_dpi

local theme = {}
theme.default_dir = require("awful.util").get_themes_dir() .. "default"
theme.icon_dir = os.getenv("HOME") .. "/.config/awesome/themes/holo/icons"
theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/themes/holo/wall.png"
theme.font_bold = "Noto Sans Bold 10"
theme.font_mono = "Noto Sans Mono 10"
theme.font = "Noto Sans Bold 10"

theme.fg_normal = "#FFFFFF"
theme.fg_focus = "#56b6c2"
theme.fg_urgent = "#CC9393"

theme.bg_focus = "#393e48"
theme.bg_normal = "#282c34"
theme.bg_urgent = "#006B8E"

theme.border_width = dpi(3)
theme.border_normal = "#252525"
theme.border_focus = "#0099CC"

theme.taglist_font = "Noto Sans Bold 8"
theme.taglist_fg_focus = "#FFFFFF"

theme.tasklist_bg_normal = "#282c34"
theme.tasklist_bg_focus = "#282c34"
theme.tasklist_fg_focus = "#73cef4"

theme.menu_height = dpi(20)
theme.menu_width = dpi(160)
theme.menu_icon_size = dpi(32)
theme.awesome_icon = theme.icon_dir .. "/awesome_icon_white.png"
theme.awesome_icon_launcher = theme.icon_dir .. "/awesome_icon.png"
theme.taglist_squares_sel = theme.icon_dir .. "/square_sel.png"
theme.taglist_squares_unsel = theme.icon_dir .. "/square_unsel.png"
theme.spr_small = theme.icon_dir .. "/spr_small.png"
theme.spr_very_small = theme.icon_dir .. "/spr_very_small.png"
theme.spr_right = theme.icon_dir .. "/spr_right.png"
theme.spr_bottom_right = theme.icon_dir .. "/spr_bottom_right.png"
theme.spr_left = theme.icon_dir .. "/spr_left.png"
theme.bar = theme.icon_dir .. "/bar.png"
theme.bottom_bar = theme.icon_dir .. "/bottom_bar.png"
theme.mpdl = theme.icon_dir .. "/mpd.png"
theme.mpd_on = theme.icon_dir .. "/mpd_on.png"
theme.prev = theme.icon_dir .. "/prev.png"
theme.nex = theme.icon_dir .. "/next.png"
theme.stop = theme.icon_dir .. "/stop.png"
theme.pause = theme.icon_dir .. "/pause.png"
theme.play = theme.icon_dir .. "/play.png"
theme.clock = theme.icon_dir .. "/clock.png"
theme.calendar = theme.icon_dir .. "/cal.png"
theme.bat = theme.icon_dir .. "/bat-75.png"
theme.cpu = theme.icon_dir .. "/cpu.png"
theme.net_up = theme.icon_dir .. "/net_up.png"
theme.net_down = theme.icon_dir .. "/net_down.png"
theme.layout_tile = theme.icon_dir .. "/tile.png"
theme.layout_tileleft = theme.icon_dir .. "/tileleft.png"
theme.layout_tilebottom = theme.icon_dir .. "/tilebottom.png"
theme.layout_tiletop = theme.icon_dir .. "/tiletop.png"
theme.layout_fairv = theme.icon_dir .. "/fairv.png"
theme.layout_fairh = theme.icon_dir .. "/fairh.png"
theme.layout_spiral = theme.icon_dir .. "/spiral.png"
theme.layout_dwindle = theme.icon_dir .. "/dwindle.png"
theme.layout_max = theme.icon_dir .. "/max.png"
theme.layout_fullscreen = theme.icon_dir .. "/fullscreen.png"
theme.layout_magnifier = theme.icon_dir .. "/magnifier.png"
theme.layout_floating = theme.icon_dir .. "/floating.png"
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.useless_gap = dpi(4)
theme.titlebar_close_button_normal = theme.default_dir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus = theme.default_dir .. "/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal = theme.default_dir .. "/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.default_dir .. "/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive = theme.default_dir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.default_dir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.default_dir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.default_dir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive = theme.default_dir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.default_dir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.default_dir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.default_dir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive = theme.default_dir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.default_dir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.default_dir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.default_dir .. "/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.default_dir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.default_dir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.default_dir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.default_dir .. "/titlebar/maximized_focus_active.png"

return theme
