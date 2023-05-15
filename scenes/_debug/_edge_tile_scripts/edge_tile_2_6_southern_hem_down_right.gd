
# adapted from new_edge_coords... .js

static func edge_tile_southern_hem_down_right(map_size, section_size, x_in, y_in):
	var section_row = ceil(y_in / section_size)
	section_row = abs(section_row - map_size * 2 - 1)
	var section_gap
	var x_in_diff = section_size - x_in % section_size
	
	match (section_row):
		1:
			section_gap = map_size - 1
		2:
			section_gap = map_size - 2
		3:
			section_gap = map_size - 4
		4:
			section_gap = map_size - 6
		5:
			section_gap = map_size - 8
		6:
			section_gap = map_size - 10
		7:
			section_gap = map_size - 12
		8:
			section_gap = map_size - 14
		9:
			section_gap = map_size - 16
		10:
			section_gap = map_size - 18
		11:
			section_gap = map_size - 20
		12:
			section_gap = map_size - 22
		13:
			section_gap = map_size - 24
		14:
			section_gap = map_size - 26
		15:
			section_gap = map_size - 28
		16:
			section_gap = map_size - 30

	var section_gap_tiles = section_gap * section_size
	var x_out = x_in + section_gap_tiles + x_in_diff + 1
	var y_out = y_in + x_in_diff
	# correcting for bottom right tiles (ex. for map_size = 4: 700, 600)
	if x_in % section_size == 0:
		x_out -= section_size
		y_out -= section_size - 1
	# correcting for bottom left tiles (ex. for map_size = 4: 501, 700)
	if x_in % section_size == 1:
		y_out += 1

#	print("input: ", x_in, ", ", y_in)
#	print("output: ", x_out, ", ", y_out)

	return [x_out, y_out]
