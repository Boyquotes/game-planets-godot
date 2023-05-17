extends Node2D

# this is what will take in data (NEVER CREATE DATA) and render it
# it will take in an entire planet's map data but only render a section (100x100)
# this will also handle the logic of what section to display based on coords coming in
# we currently have edge_tile_pair_dict, map_array, and current_player_coords coming in
# we need origin of section coords (the 1,1 of that section, the top-left)
#	we will use these to render outward from the 1,1 to the 100,100 (bottom-right) of that section

@export var tile_set_source: TileSet

func render_map(edge_tile_pair_dict, map_array, current_player_coords, section_size, tile_map_node):
	
	var section_origin_coords = []
	var section_coord_array = []
	
	# rounding down to current section's 1,1 origin tile:
	# condition making sure player isn't already at the origin tile, otherwise finding the origin tile
	if current_player_coords[0] % section_size == 1 && current_player_coords[1] % section_size == 1:
		section_origin_coords = current_player_coords
	else:
		section_origin_coords = [(current_player_coords[0] + section_size) - (current_player_coords[0] % section_size + section_size - 1), (current_player_coords[1] + section_size) - (current_player_coords[1] % section_size + section_size - 1)]

	
	# now we have section_origin_coords to start rendering "sections"
	# we are going to put these into a 2d loop (section_coord_array)
	# the indexes are the tile map coords, and the values are the map array (data) coords
	# start a 100x100 loop
	for i in section_size:
		section_coord_array.append([])
		for j in section_size:
			# add all section coords to a 2d array
			section_coord_array[i].append([section_origin_coords[0] + j, section_origin_coords[1] + i])

	
	render_tiles_in_tilemap(section_coord_array, tile_map_node, tile_set_source, section_size, map_array)

func render_tiles_in_tilemap(section_coord_array, tile_map_node, tileset_source, section_size, map_array):
	# this function takes in a 2d array (section_coord_array)
	# this array's indexes are the coords to be placed in tile_map_node (1,1 -> 100,100)
	# each index's value has an array of coords (ex. [248,611])
	# we use these to access data in the map_array
	for i in section_coord_array[0].size():
		for j in section_coord_array[1].size():
			# set tile 1
			if map_array[section_coord_array[i][j][1]][section_coord_array[i][j][0]] == 1:
				tile_map_node.set_cell(0, Vector2i(i + 1, j + 1), 0, Vector2i(0,0))
			# set tile 2
			elif map_array[section_coord_array[i][j][1]][section_coord_array[i][j][0]] == 2:
				tile_map_node.set_cell(0, Vector2i(i + 1, j + 1), 1, Vector2i(0,0))
#			print("section_coord_array[i][j][0]: ", section_coord_array[i][j][0])
#			print("section_coord_array[i][j][1]: ", section_coord_array[i][j][1])
			
	print("tiles set into tilemap")
