-- ==== WAYWALL GENERIC CONFIG ====
local main = require("main")

local remaps = require("remaps")

local cfg = {
    debug_text = false,

    -- ==== LOOKS ====
    resolution = { 1920, 1080 },

    bg_col = "#000000",
    toggle_bg_picture = false,
    text_col = "#FFFFFF",
    pie_chart_1 = "#EC6E4E",
    pie_chart_2 = "#46CE66",
    pie_chart_3 = "#E446C4",

    ninbot_anchor = {
        position = "topright", -- topleft, top, topright, left, right, bottomleft, bottomright
        x = 0,
        y = 75,               -- +130 offset for below top right timer 
    },
    ninbot_opacity = 1,        -- 0 to 1


    -- ==== ALTERNATIVE RESOLUTIONS ====
    thin_res = { 340, 1080 },
    wide_res = { 1920, 300 },
    tall_res = { 384, 16384 },


    -- ==== MIRRORS ====
    e_count = { enabled = true, x = 1340, y = 300, size = 5, colorkey = false, show_c = true },

    thin_pie = { enabled = true, x = 1200, y = 400, size = 4, colorkey = false }, -- Turning off colorkeying also maintains the original pie chart's dimensions and shows the percentages
    tall_pie = { enabled = true, x = 1200, y = 400, size = 4, colorkey = false }, -- Leave same as thin for seamlessness

    thin_percent = { enabled = false, x = 1300, y = 850, size = 6 },
    tall_percent = { enabled = false, x = 1300, y = 850, size = 6 }, -- Leave same as thin for seamlessness
    percentages_match_text = false,                                  -- Enabling this makes the percentages match the text color rather than the pie colors


    measuring_window = { x = 30, y = 340, size = 10 },
    stretched_measure = true,


    -- ==== MACROS ====
    -- resolution changes
    thin = { key = "*-Tab", f3_safe = false, ingame_only = true },
    wide = { key = "*-Super_L", f3_safe = false, ingame_only = true },
    tall = { key = "B", f3_safe = false, ingame_only = true },

    -- startup actions
    toggle_fullscreen_key = "F11",
    launch_paceman_key = "F24",

    -- during game actions
    toggle_ninbot_key = "Control-N", 
    toggle_remaps_key = "Control-U",


    -- ==== KEYBOARD ====
    xkb_config = {     -- set any setting to nil if unwanted
        enabled = true,
        layout = "mc", -- ~/.config/xkb/symbols/mc
        rules = nil,   -- ~/.config/xkb/rules/...
        variant = "basic",
        options = "caps:none",
    },
    remaps_text_config = { text = "(>u<) CHAT MODE ENABLED (^o^)", x = 200, y = 400, size = 4, color = "#ffffff" },


    -- ==== MISC ====
    sens_change = { enabled = true, normal = 10.7, tall = 0.02291164919734001, raw_input = false }, -- setting raw_input to true will enable sens changing via maccel
    enable_resize_animations = false,

}

return main(cfg, remaps)
