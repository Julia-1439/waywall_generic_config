local waywall = require("waywall")
local helpers = require("waywall.helpers")

-- ==== CFG
local res = { x = 1512, y = 945 }
local pos = { x = 306, y = 100, space = 150, size = 10 }
local shadow_color = "#000000"

-- ==== MAIN CODE DON'T TOUCH

-- dsts
local pie_dst_1 = {
    x = res.x - pos.x + 10, y = res.y - pos.y + 10, w = 13 * pos.size, h = 7 * pos.size
}
local pie_dst_1_sh = {
    x = res.x - pos.x, y = res.y - pos.y, w = 15 * pos.size, h = 9 * pos.size
}
local pie_dst_2 = {
    x = res.x - pos.x + 10 + pos.space, y = res.y - pos.y + 10, w = 13 * pos.size, h = 7 * pos.size
}
local pie_dst_2_sh = {
    x = res.x - pos.x + pos.space, y = res.y - pos.y, w = 15 * pos.size, h = 9 * pos.size
}

-- srcs
local pie_src = { x = res.x - 330, y = res.y - 220 }
-- tick
for i = 0, 6, 1 do
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 13, h = 7 },
            dst = pie_dst_2,
            depth = 3,
            color_key = { input = "#6543CA", output = "#6543CA" }
        },
        0, 0
    )
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 1, h = 1 },
            dst = pie_dst_2_sh,
            depth = 2,
            color_key = { input = "#6543CA", output = shadow_color }
        },
        0, 0
    )
end
-- level
for i = 0, 6, 1 do
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 13, h = 7 },
            dst = pie_dst_2,
            depth = 3,
            color_key = { input = "#63cbc2", output = "#63cbc2" }
        },
        0, 0
    )
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 1, h = 1 },
            dst = pie_dst_2_sh,
            depth = 2,
            color_key = { input = "#63cbc2", output = shadow_color }
        },
        0, 0
    )
end
-- entities
for i = 0, 6, 1 do
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 13, h = 7 },
            dst = pie_dst_2,
            depth = 5,
            color_key = { input = "#e145c2", output = "#e145c2" }
        },
        0, 0
    )
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 1, h = 1 },
            dst = pie_dst_2_sh,
            depth = 4,
            color_key = { input = "#e145c2", output = shadow_color }
        },
        0, 0
    )
end
-- blockEntities
for i = 0, 6, 1 do
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 13, h = 7 },
            dst = pie_dst_2,
            depth = 5,
            color_key = { input = "#c4c46d", output = "#c4c46d" }
        },
        0, 0
    )
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 1, h = 1 },
            dst = pie_dst_2_sh,
            depth = 4,
            color_key = { input = "#c4c46d", output = shadow_color }
        },
        0, 0
    )
end

-- gameRenderer
for i = 0, 6, 1 do
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 13, h = 7 },
            dst = pie_dst_1,
            depth = 5,
            color_key = { input = "#c2cbc2", output = "#c2cbc2" }
        },
        0, 0
    )
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 1, h = 1 },
            dst = pie_dst_1_sh,
            depth = 4,
            color_key = { input = "#c2cbc2", output = shadow_color }
        },
        0, 0
    )
end
-- level
for i = 0, 6, 1 do
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 13, h = 7 },
            dst = pie_dst_1,
            depth = 3,
            color_key = { input = "#63cbc2", output = "#63cbc2" }
        },
        0, 0
    )
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 1, h = 1 },
            dst = pie_dst_1_sh,
            depth = 2,
            color_key = { input = "#63cbc2", output = shadow_color }
        },
        0, 0
    )
end
-- entities
for i = 0, 6, 1 do
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 13, h = 7 },
            dst = pie_dst_1,
            depth = 5,
            color_key = { input = "#e145c2", output = "#e145c2" }
        },
        0, 0
    )
    helpers.res_mirror(
        {
            src = { x = pie_src.x, y = pie_src.y + 8 * i, w = 1, h = 1 },
            dst = pie_dst_1_sh,
            depth = 4,
            color_key = { input = "#e145c2", output = shadow_color }
        },
        0, 0
    )
end
