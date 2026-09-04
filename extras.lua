local waywall = require("waywall")
local helpers = require("waywall.helpers")
local remaps = require("remaps")

return function(config)
    local typing_in_menu = false
    local check_ingame = helpers.ingame_only(function() return true end) -- the anonymous function will return false if not ingame

    -- (*) Emulate A triggering Y when cursor-free 
    config.actions["*-A"] = function () 
        if not config.remaps_active then
            return false
        end

        if not check_ingame() and not typing_in_menu then 
            waywall.press_key("Y")
            typing_in_menu = true
        else
            return false -- Pass the A-press to MC; do not consume
        end
    end

    config.actions["*-Y"] = function () 
        if not config.remaps_active then
            return false
        end

        if not check_ingame() and not typing_in_menu then 
            waywall.press_key("A")
        else
            return false 
        end
    end
    
    -- (*)
    config.actions["*-M1"] = function ()
        typing_in_menu = false
        return false -- Pass the mouseclick to MC; do not consume
    end

    -- (*)
    waywall.listen("state", function () 
        if check_ingame() then
            typing_in_menu = false
        end
    end)

    -- Emulate W triggering A when cursor-free
    config.actions["Control-W"] = function ()
        if not config.remaps_active then
            return false
        end

        if typing_in_menu then
            waywall.press_key("A")
        else
            return false
        end
    end

    config.actions["Control-A"] = function ()
        if not config.remaps_active then
            return false
        end

        if typing_in_menu then
            waywall.press_key("W") 
        else
            return false
        end
    end

    config.actions["CAPS_LOCK"] = function ()
        if not config.remaps_active then
            return false
        end

        if not check_ingame() then 
            waywall.press_key("BACKSPACE")
        else
            return false -- Pass the capslock-press to MC; do not consume
        end

    end

    config.actions["BACKSPACE"] = function ()
        if not config.remaps_active then
            return false
        end

        if not check_ingame() then 
            waywall.press_key("CAPS_LOCK")
        else
            return false
        end
    end

    -- Ninbot appears on F3+C
    config.actions["*-C"] = function()
        if not config.remaps_active then
            return false
        end

        if waywall.get_key("F3") then
            waywall.show_floating(true)
            return false
        else
            return false
        end
    end

    local crosshair_image = nil
    local crosshair_active = nil

    local cfg = {
        -- Change your resolution here to your playing resolution, e.g. this is 1440p:
        resx = 1920,
        resy = 1080,

        size = 100,
        key = "Shift-J",
        path = os.getenv("HOME") .. "/.config/waywall/resources/oneshot crosshair.png",
    }
    config.actions[cfg.key] = function()
        if crosshair_image then
            crosshair_image:close(); crosshair_image = nil
        end
        if crosshair_active then
            crosshair_active = false
        else
            crosshair_active = true
            crosshair_image = waywall.image(cfg.path, {
                dst = {
                    x = (cfg.resx - cfg.size) / 2,
                    y = (cfg.resy - cfg.size) / 2,
                    w = cfg.size,
                    h = cfg.size,
                }
            })
        end
    end
end
