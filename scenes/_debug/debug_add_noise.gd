extends Node2D

# function that adds noise (2s) to map_array

func add_noise_to_array(map_array, random_seed, random_seed_fill_percent):
#	example for an integer between 0 and 99
#	print("rand 100: ", randi() % 100)

	for j in map_array[0].size():
		for i in map_array.size():
			if map_array[i][j] == 1:
				map_array[i][j] = 2 if randi() % 100 < random_seed_fill_percent else 1
	print("noise added to 2d array")
