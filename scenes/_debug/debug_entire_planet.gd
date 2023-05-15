extends Node2D

# this is where we render the entire planet tilemap for debugging
# the actual playable map section scene is in game/levels/level_planet_section
# some of the logic functions used to render tilemap layers will be moved to mapmaking after testing

## inspector variables
@export var tilemap_node: TileMap
@export var tileset_source: TileSet
@export var random_seed = 1.0
@export var random_seed_fill_percent = 60

# from mapmaker:
var map_size = 2
var section_size = 100
var map_width = (map_size * section_size) * 4 + 2
var map_height = map_width / 2 + 2


var map_dict_from_json = {}
var file_path_name = "res://tiled/planet_size_2.json"

var edge_tile_pair_dict = {}

func _ready():
	seed(random_seed) # adds to seed to random methods in global scope, now we can just use godot's random methods and they will pull from this seed
	var map_dict = $DebugJsonFileToDict.parse_json_file(file_path_name) # this is our dictionary (variant) parsed from our json map made in tiled
	var map_array = $DebugDictTo2dArray.dict_to_array(map_width, map_height, map_dict)
	$DebugAddNoise.add_noise_to_array(map_array, random_seed, random_seed_fill_percent)
	$DebugSetTiles.set_tiles_in_tilemap(map_array, tilemap_node, tileset_source)
	$DebugEdgeTilePairs.populate_edge_tile_pair_dict(map_array, edge_tile_pair_dict, map_size, section_size)

