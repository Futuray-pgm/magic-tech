minetest.register_node("magic_tech:structure_node", {
	description = "structure block",
	tiles = {"structure_node.png"},
	groups = {oddly_breakable_by_hand = 3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craft({
    type = "shaped",
    output = "magic_tech:structure_node 2",
    recipe = {
        {"magic_tech:crystal", "group:infested"},
        {"group:infested", "group:infested"}
    }
})

dofile(path .. "/scripts/water_purifier.lua")
