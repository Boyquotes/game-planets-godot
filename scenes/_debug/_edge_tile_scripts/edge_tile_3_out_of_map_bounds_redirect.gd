
# function that takes in the redirected coords and adjusts them if they are out of bounds of map (too far east or west) before putting them into edge_tile_pair_dict

static func out_of_map_bounds_redirect(x_out, map_array):
	if x_out > map_array.size():
		x_out -= map_array.size()
	elif x_out < map_array.size():
		x_out =+ map_array.size()
	
	return x_out
