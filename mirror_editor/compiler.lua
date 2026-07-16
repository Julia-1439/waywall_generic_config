local waywall = require("waywall")
local helpers = require("waywall.helpers")

local mirrors_cfg = {
    e_count = { enabled = nil, x = nil, y = nil, size = nil, colorkey = nil },

    thin_pie = { enabled = nil, x = nil, y = 400, size = nil, colorkey = nil },
    tall_pie = { enabled = nil, x = nil, y = 400, size = nil, colorkey = nil },

    thin_percent = { enabled = nil, x = nil, y = nil, size = nil },
    tall_percent = { enabled = nil, x = nil, y = nil, size = nil },

    measuring_window = { x = nil, y = nil, size = nil },
}

local temp_cfg = {
    e_count = { enabled = nil, x = nil, y = nil, size = nil, colorkey = nil },

    thin_pie = { enabled = nil, x = nil, y = 400, size = nil, colorkey = nil },
    tall_pie = { enabled = nil, x = nil, y = 400, size = nil, colorkey = nil },

    thin_percent = { enabled = nil, x = nil, y = nil, size = nil },
    tall_percent = { enabled = nil, x = nil, y = nil, size = nil },

    measuring_window = { x = nil, y = nil, size = nil },
}

for mirror, settings in pairs(mirrors_cfg) do
    for setting, _ in pairs(settings) do
        setting = require("mirror_editor." .. mirror .. "." .. setting)
    end
end

for mirror, settings in pairs(temp_cfg) do
    for setting, _ in pairs(settings) do
        setting = require("mirror_editor." .. mirror .. "." .. setting)
    end
end

mirrors_cfg.e_count.show_c = true
mirrors_cfg.percentages_match_text = false
mirrors_cfg.stretched_measure = require("mirror_editor.measuring_window.stretched")

temp_cfg.e_count.show_c = true
temp_cfg.percentages_match_text = false
temp_cfg.stretched_measure = require("mirror_editor.measuring_window.stretched")

local M = {}
local waywall_config_path = os.getenv("HOME") .. "/.config/waywall/"
local overlay_path = waywall_config_path .. "resources/measuring_overlay.png"
local stretched_overlay_path = waywall_config_path .. "resources/stretched_overlay.png"
EDIT_MODE = false

M.mirrors = function(cfg)
    -- colors
    local pie_colors = {
        { input = "#EC6E4E", output = cfg.pie_chart_1 },
        { input = "#46CE66", output = cfg.pie_chart_2 },
        { input = "#CC6C46", output = cfg.pie_chart_2 },
        { input = "#464C46", output = cfg.pie_chart_2 },
        { input = "#E446C4", output = cfg.pie_chart_3 }
    }
    local percentage_colors = {
        { input = "#E96D4D", output = cfg.percentages_match_text and cfg.text_col or cfg.pie_chart_1 },
        { input = "#45CB65", output = cfg.percentages_match_text and cfg.text_col or cfg.pie_chart_2 },
    }

    if cfg.mirror_editor and not EDIT_MODE then
        -- e counter
        if mirrors_cfg.e_count.enabled then
            helpers.res_mirror(
                {
                    src = mirrors_cfg.e_count.show_c
                        and { x = 1, y = 28, w = 49, h = 18 }
                        or { x = 13, y = 37, w = 37, h = 9 },
                    dst = mirrors_cfg.e_count.show_c
                        and
                        {
                            x = mirrors_cfg.e_count.x,
                            y = mirrors_cfg.e_count.y,
                            w = 49 * mirrors_cfg.e_count.size,
                            h = 18 *
                                mirrors_cfg.e_count.size
                        }
                        or
                        {
                            x = mirrors_cfg.e_count.x,
                            y = mirrors_cfg.e_count.y,
                            w = 37 * mirrors_cfg.e_count.size,
                            h = 9 *
                                mirrors_cfg.e_count.size
                        },
                    depth = 2,
                    color_key = mirrors_cfg.e_count.colorkey and {
                        input = "#DDDDDD",
                        output = mirrors_cfg.text_col,
                    } or nil,
                },
                cfg.thin_res[1], cfg.thin_res[2]
            )
            helpers.res_mirror(
                {
                    src = mirrors_cfg.e_count.show_c
                        and { x = 1, y = 28, w = 49, h = 18 }
                        or { x = 13, y = 37, w = 37, h = 9 },
                    dst = mirrors_cfg.e_count.show_c
                        and
                        {
                            x = mirrors_cfg.e_count.x,
                            y = mirrors_cfg.e_count.y,
                            w = 49 * mirrors_cfg.e_count.size,
                            h = 18 *
                                mirrors_cfg.e_count.size
                        }
                        or
                        {
                            x = mirrors_cfg.e_count.x,
                            y = mirrors_cfg.e_count.y,
                            w = 37 * mirrors_cfg.e_count.size,
                            h = 9 *
                                mirrors_cfg.e_count.size
                        },
                    depth = 2,
                    color_key = mirrors_cfg.e_count.colorkey and {
                        input = "#DDDDDD",
                        output = cfg.text_col,
                    } or nil,
                },
                cfg.tall_res[1], cfg.tall_res[2]
            )
        end

        -- thin mirrors
        if mirrors_cfg.thin_pie.enabled then
            if mirrors_cfg.thin_pie.colorkey then
                for _, ck in ipairs(pie_colors) do
                    helpers.res_mirror(
                        {
                            src = { x = cfg.thin_res[1] - 340, y = cfg.thin_res[2] - 406, w = 340, h = 178 },
                            dst = { x = mirrors_cfg.thin_pie.x, y = mirrors_cfg.thin_pie.y, w = 420 * mirrors_cfg.thin_pie.size / 4, h = 423 * mirrors_cfg.thin_pie.size / 4 },
                            depth = 2,
                            color_key = ck,
                        },
                        cfg.thin_res[1], cfg.thin_res[2]
                    )
                end
            else
                helpers.res_mirror(
                    {
                        src = { x = cfg.thin_res[1] - 340, y = cfg.thin_res[2] - 406, w = 340, h = 221 },
                        dst = { x = mirrors_cfg.thin_pie.x, y = mirrors_cfg.thin_pie.y, w = 420 * mirrors_cfg.thin_pie.size / 4, h = 273 * mirrors_cfg.thin_pie.size / 4 },
                        depth = 2,
                    },
                    cfg.thin_res[1], cfg.thin_res[2]
                )
            end
        end

        if mirrors_cfg.thin_percent.enabled then
            for _, ck in ipairs(percentage_colors) do
                helpers.res_mirror(
                    {
                        src = { x = cfg.thin_res[1] - 93, y = cfg.thin_res[2] - 221, w = 33, h = 25 },
                        dst = { x = mirrors_cfg.thin_percent.x, y = mirrors_cfg.thin_percent.y, w = 33 * mirrors_cfg.thin_percent.size, h = 25 * mirrors_cfg.thin_percent.size },
                        depth = 3,
                        color_key = ck,
                    },
                    cfg.thin_res[1], cfg.thin_res[2]
                )
            end
        end

        -- tall mirrors
        if mirrors_cfg.tall_pie.enabled then
            if mirrors_cfg.tall_pie.colorkey then
                for _, ck in ipairs(pie_colors) do
                    helpers.res_mirror(
                        {
                            src = { x = 44, y = 15978, w = 340, h = 178 },
                            dst = { x = mirrors_cfg.tall_pie.x, y = mirrors_cfg.tall_pie.y, w = 420 * mirrors_cfg.tall_pie.size / 4, h = 423 * mirrors_cfg.tall_pie.size / 4 },
                            depth = 2,
                            color_key = ck,
                        },
                        cfg.tall_res[1], cfg.tall_res[2]
                    )
                end
            else
                helpers.res_mirror(
                    {
                        src = { x = 44, y = 15978, w = 340, h = 221 },
                        dst = { x = mirrors_cfg.tall_pie.x, y = mirrors_cfg.tall_pie.y, w = 420 * mirrors_cfg.tall_pie.size / 4, h = 273 * mirrors_cfg.tall_pie.size / 4 },
                        depth = 2,
                    },
                    cfg.tall_res[1], cfg.tall_res[2]
                )
            end
        end

        if mirrors_cfg.tall_percent.enabled then
            for _, ck in ipairs(percentage_colors) do
                helpers.res_mirror(
                    {
                        src = { x = 291, y = 16163, w = 33, h = 25 },
                        dst = { x = mirrors_cfg.tall_percent.x, y = mirrors_cfg.tall_percent.y, w = 33 * mirrors_cfg.tall_percent.size, h = 25 * mirrors_cfg.tall_percent.size },
                        depth = 3,
                        color_key = ck,
                    },
                    cfg.tall_res[1], cfg.tall_res[2]
                )
            end
        end

        helpers.res_mirror(
            {
                src = mirrors_cfg.stretched_measure
                    and { x = (cfg.tall_res[1] - 30) / 2, y = (cfg.tall_res[2] - 580) / 2, w = 30, h = 580 }
                    or { x = (cfg.tall_res[1] - 60) / 2, y = (cfg.tall_res[2] - 580) / 2, w = 60, h = 580 },
                dst = { x = mirrors_cfg.measuring_window.x, y = mirrors_cfg.measuring_window.y, w = 70 * mirrors_cfg.measuring_window.size, h = 40 * mirrors_cfg.measuring_window.size },
                depth = 2,
            },
            cfg.tall_res[1], cfg.tall_res[2]
        )

        -- ==== IMAGES ====
        helpers.res_image(
            mirrors_cfg.stretched_measure and stretched_overlay_path or overlay_path,
            {
                dst = { x = mirrors_cfg.measuring_window.x, y = mirrors_cfg.measuring_window.y, w = 70 * mirrors_cfg.measuring_window.size, h = 40 * mirrors_cfg.measuring_window.size },
                depth = 3,
            },
            cfg.tall_res[1], cfg.tall_res[2]
        )
    end
end

local list_contains = function(words, word)
    for _, w in ipairs(words) do
        if w == word then return true end
    end
    return false
end

local normalize_key = function(key)
    key = key:gsub("^%*%-", "")
    key = key:lower()
    return key
end


-- EDITOR CODE
local editor_text = "Edit Mode:"
local mirror_list = {
    thin = {
        "e_counter",
        "pie",
        "percentages"
    },
    tall = {
        "e_counter",
        "pie",
        "percentages",
        "measuring_overlay"
    },
}

local editor_text_object = nil






local handler = function(key)
    print(key)
    if key == "return" then
        if editor_text_object then
            editor_text_object:close()
            editor_text_object = nil
        end
        if not EDIT_MODE then
            EDIT_MODE = true
            editor_text_object = waywall.text(editor_text, { x = 10, y = 10, size = 3, color = "#FFFFFF" })
        else
            EDIT_MODE = false
        end
    end
end

M.config_actions = function(config)
    local keys = {
        "left", "right", "up", "down",
        "tab", "space",
        "escape", "return",

    }

    local saved = {}
    for key, func in pairs(config.actions) do
        local normalized_key = normalize_key(key)
        if list_contains(keys, normalized_key) then
            config.actions[key] = function()
                return EDIT_MODE and handler(normalized_key) or func()
            end
            saved[normalized_key] = true
        else
            config.actions[key] = function()
                return not EDIT_MODE and func() or false
            end
        end
    end

    for _, letter in ipairs(keys) do
        if not saved[letter] then
            config.actions["*-" .. letter] = function()
                return EDIT_MODE and handler(letter) or false
            end
        end
    end

    config.actions["shift-return"] = function()
        return handler("return")
    end
end


return M
