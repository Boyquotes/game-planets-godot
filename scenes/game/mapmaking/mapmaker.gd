extends Node2D

# this is the manager of our map logic

# temporary inspector variables - these will become their own scripts later obviously:
## even numbers only
@export var map_size = 4 
## decimal number used to pseudo-randomize
@export var random_seed_number = 1.2
## percent of random seeding placed in array
@export var ca_seeding_fill_percent = 60
## string - type of planet (will probably change this to a number system later)
@export var biome = "earth"
## number of neighbors needed in moore neighborhood to change current tile type **will move to biomes logic
@export var threshold = 4
## number of times ca algo iterates over array **will move to biomes logic
@export var ca_loop_count = 10
## number of times ca cleanup algo iterates over array **will move to biomes logic
@export var ca_loop_count_cleanup = 6
## number of tilemap layers needed **will move to biomes logic
@export var map_layer_count = 2

var section_size = 100 # was 64
var map_width = (map_size * section_size) * 4 + 1
var map_height = map_width / 2 + 1
var map_array = []
var map_layer_arrays = []
var map_neighbor_coords_dict = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	# create array function
	$GenerateArray.generate_map_array(map_array, map_width, map_height)
	$DuplicateArrayForLayers.generate_map_array_layers(map_array, map_layer_arrays, map_layer_count)
	# TODO: create the following node + script:
	$GenerateNeighborCoordsDict.generate_map_neighbor_coords_dict(map_size, map_array, map_neighbor_coords_dict)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
