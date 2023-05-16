extends Node2D

# generate array
func generate_map_array(map_array, map_width, map_height):
	print("generate_map_array")
	for i in map_width:
		map_array.append([])
		for j in map_height:
			map_array[i].append(0) # adding zero to each cell

	# access with map_array[x][y]
	# print(map_width, "x", map_height)
	# map_array[1111][446] = 666
	# print(map_array[1111][446])

# unity difference notes:
# y is flipped - top to bottom - down is positive, up is negative
# x is the same - left to right
# map_array[1][1] # top left corner
# map_array[1600][1] # top right corner
# map_array[1600][800] # bottom right corner
# map_array[1][800] # bottom left corner

# 1,1  2,1  3,1
# 1,2  2,2  3,2
# 1,3  2,3  3,3
