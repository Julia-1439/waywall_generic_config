local waywall = require("waywall")
local helpers = require("waywall.helpers")
local remaps = require("remaps")

return function(config)
    local typing_in_menu = false
    local check_ingame = helpers.ingame_only(function() return true end) -- the anonymous function will return false if not ingame

    -- (*) Emulate A triggering Y when cursor-free 
    -- (*)
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
end
