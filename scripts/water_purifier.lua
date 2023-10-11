-- only in hand become a disabeld water purifier when placed
minetest.register_node("magic_tech:water_purifier", {
	description = "water purifier",
	tiles = {
		"structure_node.png",   -- up
		"structure_node.png",   -- down
		"structure_node.png",   -- right
		"structure_node.png",   -- left
		"machine_output.png",   -- back
		"water_purifier_max.png", -- front
	},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craft({
    type = "shaped",
    output = "magic_tech:water_purifier",
    recipe = {
        {"magic_tech:crystal", "magic_tech:structure_node", "magic_tech:crystal"},
        {"magic_tech:structure_node", "bucket:bucket_empty", "magic_tech:structure_node"},
        {"magic_tech:crystal", "magic_tech:structure_node", "magic_tech:crystal"}
    }
})

-- every productivity
minetest.register_node("magic_tech:water_purifier_disabled", {
	description = "water purifier",
	tiles = {
		"structure_node.png",   -- up
		"structure_node.png",   -- down
		"structure_node.png",   -- right
		"structure_node.png",   -- left
		"machine_output.png",   -- back
		"water_purifier_disabled.png", -- front
	},
	groups = {oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "magic_tech:water_purifier"
})
minetest.register_node("magic_tech:water_purifier_0", {
	description = "water purifier",
	tiles = {
		"structure_node.png",   -- up
		"structure_node.png",   -- down
		"structure_node.png",   -- right
		"structure_node.png",   -- left
		"machine_output.png",   -- back
		"water_purifier_0.png", -- front
	},
	groups = {oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "magic_tech:water_purifier"
})
minetest.register_node("magic_tech:water_purifier_1", {
	description = "water purifier",
	tiles = {
		"structure_node.png",   -- up
		"structure_node.png",   -- down
		"structure_node.png",   -- right
		"structure_node.png",   -- left
		"machine_output.png",   -- back
		"water_purifier_1.png", -- front
	},
	groups = {oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "magic_tech:water_purifier"
})
minetest.register_node("magic_tech:water_purifier_2", {
	description = "water purifier",
	tiles = {
		"structure_node.png",   -- up
		"structure_node.png",   -- down
		"structure_node.png",   -- right
		"structure_node.png",   -- left
		"machine_output.png",   -- back
		"water_purifier_2.png", -- front
	},
	groups = {oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "magic_tech:water_purifier"
})
minetest.register_node("magic_tech:water_purifier_max", {
	description = "water purifier",
	tiles = {
		"structure_node.png",   -- up
		"structure_node.png",   -- down
		"structure_node.png",   -- right
		"structure_node.png",   -- left
		"machine_output.png",   -- back
		"water_purifier_max.png", -- front
	},
	groups = {oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "magic_tech:water_purifier"
})

-- level functions
water_purifier = {}

local name_at_pos = function(pos)
	return minetest.get_node(pos).name
end
water_purifier.level1 = function(pos)
	local y = pos.y+1
	if name_at_pos({x=pos.x, y=y, z=pos.z}) == "default:water_source" and name_at_pos({x=pos.x+1, y=y, z=pos.z}) == "magic_tech:structure_node" and name_at_pos({x=pos.x-1, y=y, z=pos.z}) == "magic_tech:structure_node" and name_at_pos({x=pos.x, y=y, z=pos.z+1}) == "magic_tech:structure_node" and name_at_pos({x=pos.x, y=y, z=pos.z-1}) == "magic_tech:structure_node" then
		return true
	end
end
water_purifier.level2 = function(pos)
	local y = pos.y+1
	if name_at_pos({x=pos.x, y=y, z=pos.z}) == "default:water_source" and name_at_pos({x=pos.x+1, y=y, z=pos.z}) == "default:water_source" and name_at_pos({x=pos.x-1, y=y, z=pos.z}) == "default:water_source" and name_at_pos({x=pos.x, y=y, z=pos.z+1}) == "default:water_source" and name_at_pos({x=pos.x, y=y, z=pos.z-1}) == "default:water_source" and name_at_pos({x=pos.x+1, y=y, z=pos.z+1}) == "magic_tech:structure_node" and name_at_pos({x=pos.x-1, y=y, z=pos.z+1}) == "magic_tech:structure_node" and name_at_pos({x=pos.x+1, y=y, z=pos.z-1}) == "magic_tech:structure_node" and name_at_pos({x=pos.x-1, y=y, z=pos.z-1}) == "magic_tech:structure_node" and name_at_pos({x=pos.x, y=y, z=pos.z+2}) == "magic_tech:structure_node" and name_at_pos({x=pos.x, y=y, z=pos.z-2}) == "magic_tech:structure_node" and name_at_pos({x=pos.x+2, y=y, z=pos.z}) == "magic_tech:structure_node" and name_at_pos({x=pos.x-2, y=y, z=pos.z}) == "magic_tech:structure_node" then
		return true
	end
end
water_purifier.levelmax = function(pos)
	if water_purifier.level2(pos) and water_purifier.level2({x=pos.x, y=pos.y+1, z=pos.z}) then
		return true
	end
end

-- change productivity abms
minetest.register_abm({
	nodenames = {"magic_tech:water_purifier"},
	neighbors = {},
	interval = 0.1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name="magic_tech:water_purifier_disabled"})
	end
})
minetest.register_abm({
	nodenames = {"magic_tech:water_purifier_0"},
	neighbors = {},
	interval = 5.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if water_purifier.level1(pos) or water_purifier.level2(pos) or water_purifier.levelmax(pos) then
			minetest.swap_node(pos, {name = "magic_tech:water_purifier_1", param2=minetest.get_meta(pos).param2})
		end
	end
})
minetest.register_abm({
	nodenames = {"magic_tech:water_purifier_1"},
	neighbors = {},
	interval = 5.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if water_purifier.level2(pos) or water_purifier.levelmax(pos) then
			minetest.swap_node(pos, {name = "magic_tech:water_purifier_2", param2=minetest.get_meta(pos).param2})
		elseif not water_purifier.level1(pos) then
			minetest.swap_node(pos, {name = "magic_tech:water_purifier_0", param2=minetest.get_meta(pos).param2})
		end
	end
})
minetest.register_abm({
	nodenames = {"magic_tech:water_purifier_2"},
	neighbors = {},
	interval = 5.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if water_purifier.levelmax(pos) then
			minetest.swap_node(pos, {name = "magic_tech:water_purifier_max", param2=minetest.get_meta(pos).param2})
		elseif not water_purifier.level2(pos) then
			minetest.swap_node(pos, {name = "magic_tech:water_purifier_1", param2=minetest.get_meta(pos).param2})
		end
	end
})
minetest.register_abm({
	nodenames = {"magic_tech:water_purifier_max"},
	neighbors = {},
	interval = 5.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if not water_purifier.levelmax(pos) then
			minetest.swap_node(pos, {name = "magic_tech:water_purifier_2", param2=minetest.get_meta(pos).param2})
		end
	end
})

-- productions abms
minetest.register_abm({
	nodenames = {"magic_tech:water_purifier_1"},
	neighbors = {},
	interval = 15.0,
	chance = 1.5,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		meta:set_string("content_name", "purified_water")
		meta:set_int("content_value", meta:get_int("content_value")+1)
		if meta:get_int("content_value") > 16 then
			meta:set_int("content_value", 16)
		end
	end
})
minetest.register_abm({
	nodenames = {"magic_tech:water_purifier_2"},
	neighbors = {},
	interval = 5.0,
	chance = 1.5,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		meta:set_string("content_name", "purified_water")
		meta:set_int("content_value", meta:get_int("content_value")+2)
		if meta:get_int("content_value") > 16 then
			meta:set_int("content_value", 16)
		end
	end
})
minetest.register_abm({
	nodenames = {"magic_tech:water_purifier_max"},
	neighbors = {},
	interval = 5.0,
	chance = 1.5,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		meta:set_string("content_name", "purified_water")
		meta:set_int("content_value", meta:get_int("content_value")+4)
		if meta:get_int("content_value") > 16 then
			meta:set_int("content_value", 16)
		end
	end
})
