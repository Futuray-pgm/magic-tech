minetest.register_node("magic_tech:structure_node", {
	description = "structure block",
	tiles = {"structure_node.png"},
	groups = {oddly_breakable_by_hand = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("magic_tech:water_purifier", {
	description = "water purifier",
	tiles = {
        "structure_node.png",    -- up
        "structure_node.png",  -- down
        "structure_node.png", -- right
        "structure_node.png",  -- left
        "machine_output.png",  -- back
        "water_purifier_0.png", -- front
    },
	groups = {oddly_breakable_by_hand = 3},
	sounds = default.node_sound_stone_defaults(),
})