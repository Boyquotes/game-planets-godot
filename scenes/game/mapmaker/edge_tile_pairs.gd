extends Node2D

# function filled with functions in conditionals
# going to have 8 other function files not attached to this node
# we can call these functions with preload
# example from https://godotengine.org/qa/36707/there-way-call-function-that-inside-script-not-connected-node :
#var script = preload("res://script.gd")
#var instance = script.new()
#instance.hello()


func populate_edge_tile_pair_dict(map_array, edge_tile_pair_dict, map_size, section_size, map_width):
	var equator = map_array[0].size() / 2
	# TODO: see if we can run these without instancing (something about static functions...)
	var edge_tile_1 = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_1_main_neighborhood.gd")
	var edge_tile_1_instance = edge_tile_1.new()
	var edge_tile_2 = preload("res://scenes/game/mapmaker/edge_tile_scripts/edge_tile_2_redirect_logic.gd")
	var edge_tile_2_instance = edge_tile_2.new()
	# key value pair structure with sub dict:
	# {[2,2]: {"down": [2,1], "left": [1,2]}
	# adding a new key(coords) value(nested dict) pair to dict ([10,10] does not yet exist:
	# edge_tile_pair_dict[[10,10]] = {"right": [11,10]}
	# adding a new key value pair to existing nested dict (original key of [10,10] must already exist):
	# edge_tile_pair_dict[[10,10]].left = [9,10]


	var return_dict = {}
	var skip_east = false
	var skip_south = false
	var response
	# TODO: loop through map array and check neighboring tiles for 0s (if it has a 0 neighbor, it is an edge tile)
	for j in map_array[0].size() - 1:
		for i in map_array.size() - 1:
			if map_array[i][j] != 0:
				# will return true if coords are an edge tile:
				response = edge_tile_1_instance.is_edge_tile(map_array, [i,j], return_dict)
				if response != {}:
					# add an key of coords with dict from is_edge_tile response
					edge_tile_pair_dict[[i,j]] = response
	# print(edge_tile_pair_dict) # we now have all edge coords as keys with dicts of direction keys with empty arrays as values - next we need to run algo to add the paired tiles to those empty array values of direction keys
	
#	print("1,1: ", edge_tile_pair_dict[[1,1]])
	
	# then loop through the keys (array of coords) in the dict and run through our edge coords conditionals to run the appropriate algorithm to find its neighbors
	# TODO: edge_tile_2_redirect_logic
	for i in edge_tile_pair_dict:
		edge_tile_2_instance.edge_tile_redirect_logic(i, edge_tile_pair_dict, map_size, section_size, equator, map_width)

	# for each neighbor, add the direction and target coords to the appropriate nested dict, for example:
	# edge_tile_pair_dict[[10,10]].left = [9,10]
	# ^^ we can do it this way because [10,10] : {} should already exist
	
#	print(edge_tile_pair_dict)
