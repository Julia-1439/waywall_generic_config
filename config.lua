-- ==== WAYWALL GENERIC CONFIG ====
return {
    debug_text = false,

    -- ==== LOOKS ====
    resolution = { 1512, 945 },

    bg_col = "#4d3f3f",
    toggle_bg_picture = false,
    text_col = "#eac1c1",
    pie_chart_1 = "#EC6E4E",
    pie_chart_2 = "#46CE66",
    pie_chart_3 = "#E446C4",

    ninbot_anchor = {
        position = "topright", -- topleft, top, topright, left, right, bottomleft, bottomright
        x = 0,
        y = 0,               -- offset
    },
    ninbot_opacity = 1,        -- 0 to 1


    -- ==== ALTERNATIVE RESOLUTIONS ====
    thin_res = { 340, 945 },
    wide_res = { 1512, 225 },
    tall_res = { 384, 16384 },


    -- ==== MIRRORS ====
    e_count = { enabled = true, x = 1000, y = 300, size = 5, colorkey = true },

    thin_pie = { enabled = true, x = 990, y = 370, size = 3, colorkey = true }, -- Turning off colorkeying also maintains the original pie chart's dimensions and shows the percentages
    tall_pie = { enabled = true, x = 990, y = 370, size = 3, colorkey = true }, -- Leave same as thin for seamlessness

    thin_percent = { enabled = true, x = 1050, y = 450, size = 6 },
    tall_percent = { enabled = true, x = 1050, y = 450, size = 6 }, -- Leave same as thin for seamlessness
    percentages_match_text = true,                                   -- Enabling this makes the percentages match the text color rather than the pie colors


    measuring_window = { enabled = true, x = 0, y = 340, size = 8 },
    stretched_measure = true,


    -- ==== KEYBINDS ====
    -- resolution changes
    thin = { key = "*-Alt_L", f3_safe = false, ingame_only = true },
    wide = { key = "*-B", f3_safe = true, ingame_only = true },
    tall = { key = "*-F4", f3_safe = true, ingame_only = false },

    -- startup actions
    toggle_fullscreen_key = "Shift-O",
    launch_paceman_key = "Shift-P",

    -- during game actions
    toggle_ninbot_key = "*-apostrophe",
    toggle_remaps_key = "Backspace",


    -- ==== KEYBOARD ====
    xkb_config = {     -- set any setting to nil if unwanted
        enabled = true,
        layout = "mc", -- ~/.config/xkb/symbols/mc
        rules = nil,   -- ~/.config/xkb/rules/...
        variant = "basic",
        options = "caps:none",
    },
    remaps_text_config = { text = "chat mode", x = 100, y = 100, size = 2, color = "#ff0000" },


    -- ==== MISC ====
    sens_change = { enabled = true, normal = 8.0, tall = 0.2 }, -- make sure raw input is off
    enable_resize_animations = false,

}
