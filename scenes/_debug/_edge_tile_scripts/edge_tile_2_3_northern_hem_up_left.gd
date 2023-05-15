
# adapted from new_edge_coords... .js

static func edge_tile_northern_hem_up_left(map_size, section_size, x_in, y_in):
	var section_row = ceil(y_in / section_size)
	var section_gap
	var x_in_diff = x_in % section_size
	print("input: ", x_in, ", ", y_in)
	print(section_row)
	
	match (section_row):
		1:
			section_gap = map_size - 1
		2:
			section_gap = map_size - 3
		3:
			section_gap = map_size - 5
		4:
			section_gap = map_size - 7
		5:
			section_gap = map_size - 9
		6:
			section_gap = map_size - 11
		7:
			section_gap = map_size - 13
		8:
			section_gap = map_size - 15
		9:
			section_gap = map_size - 17
		10:
			section_gap = map_size - 19
		11:
			section_gap = map_size - 21
		12:
			section_gap = map_size - 23
		13:
			section_gap = map_size - 25
		14:
			section_gap = map_size - 27
		15:
			section_gap = map_size - 29
		16:
			section_gap = map_size - 31

	print(section_gap)
	var section_gap_tiles = section_gap * section_size
	var x_out = x_in - section_gap_tiles - x_in_diff
	var y_out = y_in + (section_size - x_in_diff) - 1
	# correcting for top right tiles (ex. for map_size = 4: 1200, 101)
	if x_in % section_size == 0:
		y_out = y_in
		x_out -= section_size
	# correcting for top left tiles (ex. for map_size = 4: 301, 101)
	if x_in % section_size == 1:
		y_out += 1

#	print("input: ", x_in, ", ", y_in)
#	print("output: ", x_out, ", ", y_out)

	return [x_out, y_out]
