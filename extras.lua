local waywall = require("waywall")
local helpers = require("waywall.helpers")

return function(config)
    -- Add any extra code here

    -- stretched wide
    helpers.res_mirror({
            src = { x = 0, y = 0, w = 3024, h = 450 },
            dst = { x = 0, y = 0, w = 3024, h = 1890 },
            depth = 1,
        },
        3024, 450
    )

    -- show ninbot on f3+c
    config.actions["*-C"] = function()
        if waywall.get_key("F3") then
            waywall.show_floating(true)
        end
        return false
    end

    -- preemptive spikes
    helpers.res_image(
        os.getenv("HOME") .. "/.config/waywall/resources/cheatsheet.png",
        {
            dst = { x = 965, y = 680, w = 550, h = 250 },
            depth = 1,
        },
        340, 945
    )
    helpers.res_image(
        os.getenv("HOME") .. "/.config/waywall/resources/cheatsheet.png",
        {
            dst = { x = 965, y = 680, w = 550, h = 250 },
            depth = 1,
        },
        384, 16384
    )


    require("mirrors")


    config.experimental.tearing = true


    -- glowdar

    helpers.res_mirror(
        {
            src = { x = 1410, y = 720, w = 50, h = 30 },
            dst = { x = 1250, y = 580, w = 200, h = 120 },
            color_key = { input = "#4de1ca", output = "#4de1ca" },
            depth = 4,
        },
        0, 0
    )
    helpers.res_mirror(
        {
            src = { x = 1410, y = 720, w = 50, h = 30 },
            dst = { x = 1250+4, y = 580+4, w = 200, h = 120 },
            color_key = { input = "#4de1ca", output = "#000000" },
            depth = 3,
        },
        0, 0
    )

    -- config.experimental.debug = true

    -- END
end
