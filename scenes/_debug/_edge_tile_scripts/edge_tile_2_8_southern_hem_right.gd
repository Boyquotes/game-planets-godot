
# adapted from new_edge_coords... .js

static func edge_tile_southern_hem_right(map_size, section_size, x_in, y_in, map_width, out_of_map_bounds_redirect):
	var section_row = ceil(float(y_in) / float(section_size))
	section_row = int(section_row)
	section_row = abs(section_row - map_size * 2 - 1)
	var section_gap
	var y_in_diff = section_size - y_in % section_size
	
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

	var section_gap_tiles = section_gap * section_size
	var x_out = x_in + section_gap_tiles + y_in_diff
	var y_out = y_in + y_in_diff
	# correcting for top right tiles (ex. for map_size = 4: 600, 601)
	if y_in % section_size == 1:
		x_out -= section_size - 2
	# correcting for bottom right tiles (ex. for map_size = 4: 600, 700)
	if y_in % section_size == 0:
		y_out -= section_size
		
	x_out = out_of_map_bounds_redirect.out_of_map_bounds_redirect(x_out, map_width)

#	print("input: ", x_in, ", ", y_in)
#	print("output: ", x_out, ", ", y_out)

	return [x_out, y_out]
