extends Node2D

func set_tiles_in_tilemap(map_array, map_width, map_height, tilemap_node, tileset_source):
	# TODO: use map array of 1s and 0s to set tiles to tilemap for entire planet visual debug
#	print(tileset_source.source_id)
	for j in map_height:
		for i in map_width:
#			print(i, ", ", j)
			if map_array[i][j] == 1:
				# set tile 1
				tilemap_node.set_cell(0, Vector2i(i,j), 3, Vector2i(0,0))
				# seems to be working
