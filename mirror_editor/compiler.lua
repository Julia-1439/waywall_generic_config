-- imports

local mirrors_cfg = {
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

mirrors_cfg.e_count.show_c = false
mirrors_cfg.percentages_match_text = false
mirrors_cfg.stretched_measure = require("mirror_settings.measuring_window.stretched")
