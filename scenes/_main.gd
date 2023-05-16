extends Node

# this is the root/intro/main/whatever scene that is the parent of all others

var edge_tile_pair_dict = {}
var map_array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# data we need in main:
	$_Mapmaker.make_map(edge_tile_pair_dict, map_array)
