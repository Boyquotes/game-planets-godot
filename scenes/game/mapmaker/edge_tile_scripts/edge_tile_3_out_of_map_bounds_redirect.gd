
# function that takes in the redirected coords and adjusts them if they are out of bounds of map (too far east or west) before putting them into edge_tile_pair_dict

static func out_of_map_bounds_redirect(x_out, map_width):
	if x_out > map_width - 2:
		x_out -= map_width - 2
	elif x_out < map_width - 2:
		x_out += map_width - 2
	
	return x_out
