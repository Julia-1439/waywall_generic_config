local waywall = require("waywall")
local helpers = require("waywall.helpers")
local remaps = require("remaps")

local typing_in_menu = false
local check_ingame = helpers.ingame_only(function() return true end) -- the anonymous function will return false if not ingame
return function(config)
    -- Add any extra code here
    config.actions["*-A"] = function () 
        if not check_ingame() and (not typing_in_menu) then 
            waywall.press_key("Y")
            typing_in_menu = true
        else
            return false -- Pass the A-press to MC; do not consume
        end
    end

    config.actions["*-M1"] = function ()
        typing_in_menu = false
        return false -- Pass the mouseclick to MC; do not consume
    end

    waywall.listen("state", function () 
        if check_ingame() then
            typing_in_menu = false
        end
    end)

    config.actions["Control-W"] = function ()
        if typing_in_menu then
            waywall.press_key("A")
        else
            return false
        end
    end

    config.actions["*-C"] = function()
        if waywall.get_key("F3") then
            waywall.show_floating(true)
            return false
        else
            return false
        end
    end

    -- END
end
