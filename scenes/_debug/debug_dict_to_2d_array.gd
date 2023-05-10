extends Node2D

# generating 2d array:
func dict_to_array(map_width, map_height, map_dict):
	var map_array = []
	for i in map_width:
		map_array.append([])
		for j in map_height:
			map_array[i].append(666) # adding 666 to each cell

	# putting our dict values (1s and 0s) into 2d array :
	var x = 0
	var y = 0
	for n in map_dict.data:
		map_array[x][y] = n
		if x == map_width - 1:
			x = 0
			y += 1
		else:
			x += 1
		if x == map_width && y == map_height:
			return map_array

	print("dict parsed into 2d array")
#	print(map_array) # this is our map array of 0s and 1s!
	return map_array
	
	# access with map_array[x][y]
	# unity difference notes:
		# y is flipped - top to bottom - down is positive, up is negative
		# x is the same - left to right
		# map_array[0][0] # top left corner
		# map_array[800][0] # top right corner
		# map_array[800][400] # bottom right corner
		# map_array[0][400] # bottom left corner

		# 1,1  2,1  3,1
		# 1,2  2,2  3,2
		# 1,3  2,3  3,3
	
