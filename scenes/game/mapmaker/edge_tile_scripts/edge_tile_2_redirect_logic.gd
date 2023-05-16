
# adapted from edge_coords_starting_logic.js
# function that is used on known edge tiles to determine their linked tiles
# this will be a fork in the road, splitting off into each algorithm

func edge_tile_redirect_logic(coords, edge_tile_pair_dict, map_size, section_size, equator, map_width):
	# don't forget that north/south are flipped, so y + 1 moves south
	var x_in = coords[0]
	var y_in = coords[1]
	var hemisphere = "southern" if coords[1] > equator else "northern"
	var section_column = ceil(x_in / section_size)
	var slice_column = section_column % map_size
	var secondary_direction = "east" if slice_column > 1 && slice_column <= map_size /2 + 1 else "west"
	
	var northern_hem_left = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_2_1_northern_hem_left.gd")
#	var northern_hem_left_instance = northern_hem_left.new()
	var northern_hem_right = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_2_2_northern_hem_right.gd")
	var northern_hem_up_left = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_2_3_northern_hem_up_left.gd")
	var northern_hem_up_right = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_2_4_northern_hem_up_right.gd")
	var southern_hem_down_left = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_2_5_southern_hem_down_left.gd")
	var southern_hem_down_right = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_2_6_southern_hem_down_right.gd")
	var southern_hem_left = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_2_7_southern_hem_left.gd")
	var southern_hem_right = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_2_8_southern_hem_right.gd")
	var out_of_map_bounds_redirect = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_3_out_of_map_bounds_redirect.gd")

	# using a loop because some coords will have more than one direction
	for i in edge_tile_pair_dict[[x_in, y_in]]:
		if hemisphere == "southern":
			if i == "west":
				# SOUTH HEM LEFT
				edge_tile_pair_dict[[x_in,y_in]]["west"] = southern_hem_left.edge_tile_southern_hem_left(map_size, section_size, x_in, y_in, map_width, out_of_map_bounds_redirect)
			elif i == "east":
				# SOUTH HEM RIGHT
				edge_tile_pair_dict[[x_in,y_in]]["east"] = southern_hem_right.edge_tile_southern_hem_right(map_size, section_size, x_in, y_in, map_width, out_of_map_bounds_redirect)
				pass
			elif i == "south" && secondary_direction == "east":
				# SOUTH HEM DOWN RIGHT
				edge_tile_pair_dict[[x_in,y_in]]["south"] = southern_hem_down_right.edge_tile_southern_hem_down_right(map_size, section_size, x_in, y_in, map_width, out_of_map_bounds_redirect)
			elif i == "south" && secondary_direction == "west":
				# SOUTH HEM DOWN LEFT
				edge_tile_pair_dict[[x_in,y_in]]["south"] = southern_hem_down_left.edge_tile_southern_hem_down_left(map_size, section_size, x_in, y_in, map_width, out_of_map_bounds_redirect)
		elif hemisphere == "northern":
			if i == "west":
				# NORTH HEM LEFT
				edge_tile_pair_dict[[x_in,y_in]]["west"] = northern_hem_left.edge_tile_northern_hem_left(map_size, section_size, x_in, y_in, map_width, out_of_map_bounds_redirect)
			elif i == "east":
				# NORTH HEM RIGHT
				edge_tile_pair_dict[[x_in,y_in]]["east"] = northern_hem_right.edge_tile_northern_hem_right(map_size, section_size, x_in, y_in, map_width, out_of_map_bounds_redirect)
			elif i == "north" && secondary_direction == "east":
				# NORTH HEM UP RIGHT
				edge_tile_pair_dict[[x_in,y_in]]["north"] = northern_hem_up_right.edge_tile_northern_hem_up_right(map_size, section_size, x_in, y_in, map_width, out_of_map_bounds_redirect)
			elif i == "north" && secondary_direction == "west":
				# NORTH HEM UP LEFT
				edge_tile_pair_dict[[x_in,y_in]]["north"] = northern_hem_up_left.edge_tile_northern_hem_up_left(map_size, section_size, x_in, y_in, map_width, out_of_map_bounds_redirect)
