-- constants for all the scripts
path = minetest.get_modpath("magic_tech")
infastable_nodes = {"stone", "sand", "cobble", "dirt", "silver_sand"}
version = "0.0.3"
function node_in_group(name, group)
	if not minetest.registered_nodes[name] or not minetest.registered_nodes[name].groups[group] then
		return false
	end
	return true
end

minetest.register_on_joinplayer( function(player)
	local name = player:get_player_name()
	minetest.show_formspec(name, "magic_tech:welcome_form", "size[8,9]" ..
				"label[0,0;" .. minetest.colorize("#808", "Hello, " .. name .. "! Thanks for downloading Magic Tech :)") .. "]" ..
				"label[0,1.5;" .. minetest.colorize("#B7B", "Changes in version " .. version .. ":") .. "]" ..
				"label[0,2.25;" .. minetest.colorize("#B7B", "  · new structure node") .. "]" ..
				"label[0,3;" .. minetest.colorize("#B7B", "  · new water purifier") .. "]" ..
				"label[0,3.75;" .. minetest.colorize("#B7B", "  · more infested nodes") .. "]" ..
				"label[0,4.5;" .. minetest.colorize("#B7B", "  · this message") .. "]" ..
				"button_exit[2,8;4,1;exit;OK, let's play!]")
end)

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

-- Infested nodes
for i=1,table.getn(infastable_nodes) do
	node = infastable_nodes[i]
	minetest.register_node("magic_tech:infested_" .. node, {
		description = "infested " .. node:gsub("_", " "),
		tiles = {"default_" .. node ..".png^infested_node.png"},
		groups = {cracky = 2, infested = 1},
		drop = "magic_tech:infested_" .. node,
		sounds = default.node_sound_stone_defaults(),
	})
end

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

-- import scripts
dofile(path .. "/machines.lua")
dofile(path .. "/scripts/wands.lua")
