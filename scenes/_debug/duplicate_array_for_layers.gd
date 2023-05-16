extends Node2D

# method for duplicating map_array

func generate_map_array_layers(map_array, map_layer_arrays, map_layer_count):
	for n in range(1,map_layer_count + 1):
		print("layer ", n)
		# https://docs.godotengine.org/en/stable/classes/class_array.html#class-array-method-duplicate
		map_layer_arrays.append(map_array.duplicate(true)) # true = deep
		# print("array size: ", map_layer_arrays.size())
