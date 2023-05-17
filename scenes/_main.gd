extends Node

# this is the root/intro/main/whatever scene that is the parent of all others

@export var current_player_coords = []
@export var tile_map = TileMap
var edge_tile_pair_dict = {}
var map_array = []
var section_size = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	# data we need in main:
	$_MapMaker.make_map(edge_tile_pair_dict, map_array, section_size)
	
	#TODO: debug why map_array is empty - we need it in render_map *MOST IMPORTANT CURRENT NEED*
	
	print(map_array)
	$_MapRenderer.render_map(edge_tile_pair_dict, map_array, current_player_coords, section_size, tile_map)
