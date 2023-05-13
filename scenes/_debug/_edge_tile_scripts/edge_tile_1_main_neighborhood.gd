
# function to check the main neighbors (n, s, e, w) of a cell and returns direction keys with empty arrays in a dict if any of them are 0 - else returns false
# this doesn't involve any fancy jumping around on the map - this is only to let us know if a cell has an 0s for neighbors so that we know that it is an edge cell



# TODO: may want to add another row/column of 0s in tiled json file so that we have 0s surrounding entire useable tilemap - will help having to do these weird conditionals because checking for neighbors that don't exist at all doesn't return null, it errors out

func is_edge_tile(map_array, coords_to_check, return_dict, skip_east, skip_south):
	return_dict = {}
	# east edge of map check so attempting to access outside bounds of array below doesn't happen (errors)
	if coords_to_check[0] == map_array.size() - 1:
		return_dict["east"] = []
		skip_east = true
	# south edge of map check so attempting to access outside bounds of array below doesn't happen (errors)
	if coords_to_check[1] == map_array[0].size() - 1:
		return_dict["south"] = []
		skip_south = true
	# north (y-1)
	if map_array[coords_to_check[0]][coords_to_check[1] - 1] == 0 || map_array[coords_to_check[0]][coords_to_check[1] - 1] == null:
		return_dict["north"] = []
	# south (y+1)
	if (map_array[coords_to_check[0]][coords_to_check[1] + 1] == 0 || map_array[coords_to_check[0]][coords_to_check[1] + 1] == null)&& skip_south == false:
		return_dict["south"] = []
	# east (x+1)
	if (map_array[coords_to_check[0] + 1][coords_to_check[1]] == 0 || map_array[coords_to_check[0] + 1][coords_to_check[1]] == null) && skip_east == false:
		return_dict["east"] = []
	# west (x-1)
	if map_array[coords_to_check[0] - 1][coords_to_check[1]] == 0 || map_array[coords_to_check[0] - 1][coords_to_check[1]] == null:
		return_dict["west"] = []

	return return_dict
