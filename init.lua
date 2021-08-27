print("magic_tech has loaded")

-- Magi Crystal
minetest.register_craftitem("magic_tech:magicrystal", {
	description = "Magicrystal",
	inventory_image = "magic_tech_mineral_magicrystal.png"
})
minetest.register_node("magic_tech:stone_with_magicrystal", {
	description = "Magi Crystal",
	tiles = {"default_stone.png^magic_tech_mineral_magicrystal.png"},
	groups = {cracky = 3},
	drop = "magic_tech:magicrystal",
	sounds = default.node_sound_stone_defaults(),
})

-- Starting out with the ore parameters for coal
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "magic_tech:stone_with_magicrystal",
	wherein        = "default:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 9,
	clust_size     = 3,
	y_max          = 31000,
	y_min          = 1025,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "magic_tech:stone_with_magicrystal",
	wherein        = "default:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 8,
	clust_size     = 3,
	y_max          = 64,
	y_min          = -127,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "magic_tech:stone_with_magicrystal",
	wherein        = "default:stone",
	clust_scarcity = 12 * 12 * 12,
	clust_num_ores = 30,
	clust_size     = 5,
	y_max          = -128,
	y_min          = -31000,
})
