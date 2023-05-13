extends Node2D

func set_tiles_in_tilemap(map_array, tilemap_node, tileset_source):
	
	for j in map_array[0].size(): # height
		for i in map_array.size(): # width
			if map_array[i][j] == 1:
				# set tile 1
				tilemap_node.set_cell(0, Vector2i(i,j), 3, Vector2i(0,0))
			elif map_array[i][j] == 2:
				tilemap_node.set_cell(0, Vector2i(i,j), 4, Vector2i(0,0))
				
	print("tiles set into tilemap")
