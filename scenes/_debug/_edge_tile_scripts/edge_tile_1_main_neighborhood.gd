
# function to check the main neighbors (n, s, e, w) of a cell and return true if any of them are 0
# this doesn't involve any fancy jumping around on the map - this is only to let us know if a cell has an 0s for neighbors so that we know that it is an edge cell

func is_edge_tile(map_array, coords_to_check):
	# north (y-1)
	if coords_to_check[0] == map_array.size() - 1 || coords_to_check[1] == map_array[0].size() - 1:
		return true
	elif map_array[coords_to_check[0]][coords_to_check[1] - 1] == 0 || map_array[coords_to_check[0]][coords_to_check[1] - 1] == null:
		return true
	# south (y+1)
	elif map_array[coords_to_check[0]][coords_to_check[1] + 1] == 0 || map_array[coords_to_check[0]][coords_to_check[1] + 1] == null:
		return true
	# east (x+1)
	elif map_array[coords_to_check[0] + 1][coords_to_check[1]] == 0 || map_array[coords_to_check[0] + 1][coords_to_check[1]] == null:
		return true
	# west (x-1)
	elif map_array[coords_to_check[0] - 1][coords_to_check[1]] == 0 || map_array[coords_to_check[0] - 1][coords_to_check[1]] == null:
		return true
	else:
		return false
