print("magic_tech has loaded")

powerless_wand = {}
activated_wand = {}

-- Functions
powerless_wand.use = function(itemstack, user, pointed)
	local pointed_node = minetest.get_node(pointed.under)
	if pointed_node == "magic_tech:infested_stone" then
		minetest.place_node(pointed_thing.under, "default:stone")
	end
	return 
end
activated_wand.use = function(itemstack, user, pointed)
	local pointed_node = minetest.get_node(pointed.under)
	minetest.chat_send_all(pointed_node)
	if pointed_node == "default:stone" then
		minetest.place_node(pointed_thing.under, "magic_tech:infested_stone")
	end
	return 
end

-- Crystal
minetest.register_craftitem("magic_tech:crystal", {
	description = "crystal",
	inventory_image = "crystal.png"
})
minetest.register_node("magic_tech:stone_with_crystal", {
	description = "crystal ore",
	tiles = {"default_stone.png^crystal.png"},
	groups = {cracky = 3},
	drop = "magic_tech:crystal",
	sounds = default.node_sound_stone_defaults(),
})

-- Wand
minetest.register_tool("magic_tech:powerless_wand", {
	description = "powerless wand",
	inventory_image = "powerless_wand.png",
	on_place = function(itemstack, user, pointed)
		powerless_wand.use(itemstack, user, pointed)
		return itemstack
	end,
})
minetest.register_tool("magic_tech:activated_wand", {
	description = "activated wand",
	inventory_image = "activated_wand.png",
	on_place = function(itemstack, user, pointed)
		activated_wand.use(itemstack, user, pointed)
		return
	end,
})

-- Other
minetest.register_node("magic_tech:infested_stone", {
	description = "infested stone",
	tiles = {"default_stone.png^infested_node.png"},
	groups = {cracky = 1},
	drop = "magic_tech:infested_stone",
	sounds = default.node_sound_stone_defaults(),
})

-- Crafts
minetest.register_craft({
    type = "shaped",
    output = "magic_tech:powerless_wand 1",
    recipe = {
        {"magic_tech:crystal"},
        {"group:stick"}
    }
})
minetest.register_craft({
    type = "shaped",
    output = "magic_tech:activated_wand 1",
    recipe = {
        {"", "default:mese_crystal", ""},
        {"default:mese_crystal", "magic_tech:powerless_wand", "default:mese_crystal"},
        {"", "default:mese_crystal", ""}
    }
})

-- Ore parameters
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "magic_tech:stone_with_crystal",
	wherein        = "default:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 9,
	clust_size     = 3,
	y_max          = 31000,
	y_min          = 1025,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "magic_tech:stone_with_crystal",
	wherein        = "default:stone",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 8,
	clust_size     = 3,
	y_max          = 64,
	y_min          = -127,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "magic_tech:stone_with_crystal",
	wherein        = "default:stone",
	clust_scarcity = 12 * 12 * 12,
	clust_num_ores = 30,
	clust_size     = 5,
	y_max          = -128,
	y_min          = -31000,
})
