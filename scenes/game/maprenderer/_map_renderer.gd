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
	# condition: player is already at the origin tile
	if current_player_coords[0] % section_size == 1 && current_player_coords[1] % section_size == 1:
		section_origin_coords = current_player_coords
	else:
		section_origin_coords = [(current_player_coords[0] + section_size) - (current_player_coords[0] % section_size + section_size - 1), (current_player_coords[1] + section_size) - (current_player_coords[1] % section_size + section_size - 1)]
		
	print("origin: ", section_origin_coords)
	# now we have section_origin_coords to start rendering "sections"
	# start a 100x100 loop
	for j in section_size:
		for i in section_size:
			# add all section coords to a 2d array
			section_coord_array.append([section_origin_coords[0] + i, section_origin_coords[1] + j])
			# use % section_size on these when placing so that ex. [456, 298] would render at coords [56, 98] on the tile map

	render_tiles_in_tilemap(section_coord_array, tile_map_node, tile_set_source, section_size, map_array)

func render_tiles_in_tilemap(section_coord_array, tilemap_node, tileset_source, section_size, map_array):
	var x = 666
	var y = 666
	
	for j in section_coord_array[0].size(): # height
		for i in section_coord_array.size(): # width
			# using % section_size on these when placing so that ex. [456, 298] would render at coords [56, 98] on the tile map
			if i == section_size:
				x = i
			else:
				x = i % section_size
				
			if i == section_size:
				y = j
			else:
				y = j % section_size
				
			print(map_array)
			if map_array[i][j] == 1:
				# set tile 1
				tilemap_node.set_cell(0, Vector2i(x,y), 0, Vector2i(0,0))
			elif map_array[i][j] == 2:
				tilemap_node.set_cell(0, Vector2i(x,y), 1, Vector2i(0,0))
				
	print("tiles set into tilemap")
