
# adapted from new_edge_coords... .js

static func edge_tile_southern_hem_left(map_size, section_size, x_in, y_in):
	var section_row = ceil(y_in / section_size)
	section_row = abs(section_row - map_size * 2 - 1)
	var section_gap
	var y_in_diff = section_size - y_in % section_size
	
	match (section_row):
		1:
			section_gap = map_size - 2
		2:
			section_gap = map_size - 4
		3:
			section_gap = map_size - 6
		4:
			section_gap = map_size - 8
		5:
			section_gap = map_size - 10
		6:
			section_gap = map_size - 12
		7:
			section_gap = map_size - 14
		8:
			section_gap = map_size - 16
		9:
			section_gap = map_size - 18
		10:
			section_gap = map_size - 20
		11:
			section_gap = map_size - 22
		12:
			section_gap = map_size - 24
		13:
			section_gap = map_size - 26
		14:
			section_gap = map_size - 28
		15:
			section_gap = map_size - 30
		16:
			section_gap = map_size - 32

	var section_gap_tiles = section_gap * section_size
	var x_out = x_in - section_gap_tiles - (section_size - y_in_diff) - 1
	var y_out = y_in - (section_size - y_in_diff)
	# correcting for top left tiles (ex. for map_size = 4: 701, 601)
	if y_in % section_size == 1:
		x_out += 1
	# correcting for bottom left tiles (ex. for map_size = 4: 801, 800)
	if y_in % section_size == 0:
		x_out -= section_size - 1
		y_out -= section_size

#	print("input: ", x_in, ", ", y_in)
#	print("output: ", x_out, ", ", y_out)

	return [x_out, y_out]
