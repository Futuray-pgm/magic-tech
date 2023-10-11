powerless_wand = {}
activated_wand = {}

-- Functions
powerless_wand.use = function(itemstack, user, pointed)
	local pointed_node = minetest.get_node(pointed.under).name
	if node_in_group(pointed_node, "infested") then
		minetest.set_node(pointed.under, {name = "default:" .. pointed_node:gsub("magic_tech:infested_", "")})
	elseif pointed_node == "magic_tech:water_purifier_0" or pointed_node == "magic_tech:water_purifier_2" or pointed_node == "magic_tech:water_purifier_1" or pointed_node == "magic_tech:water_purifier_max" then
		minetest.set_node(pointed.under, {name = "magic_tech:water_purifier_disabled"})
	end
	return 
end
activated_wand.use = function(itemstack, user, pointed)
	local pointed_node = minetest.get_node(pointed.under).name
	local in_infastable_nodes = "none"
	for i=1,table.getn(infastable_nodes) do
		if pointed_node:gsub("default:", "") == infastable_nodes[i] then
			in_infastable_nodes = "magic_tech:infested_" .. infastable_nodes[i]
		end
	end
	if in_infastable_nodes ~= "none" then
		minetest.set_node(pointed.under, {name = in_infastable_nodes})
	elseif pointed_node == "magic_tech:water_purifier_disabled" then
		minetest.set_node(pointed.under, {name = "magic_tech:water_purifier_0"})
	end
	return 
end

-- Crafts and defs
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
