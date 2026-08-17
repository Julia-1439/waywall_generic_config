return {
    remapped_kb = {
        -- Add any playing remaps here
        ["CAPSLOCK"] = "F3", 
        ["LEFTALT"] = "RIGHTSHIFT",
        ["5"] = "0",

        -- Swap to avoid duplicate keys for same input
        ["F3"] = "CAPSLOCK",
        ["RIGHTSHIFT"] = "LEFTALT",
        ["0"] = "5", 
    },

    menu_kb = {
        ["A"] = "Y",
        ["Y"] = "A",
        ["CAPSLOCK"] = "BACKSPACE",
        ["BACKSPACE"] = "CAPSLOCK",
    },

    normal_kb = {
        -- Add any remaps you want to keep when disabling normal remaps (not necessary)

    },

}
