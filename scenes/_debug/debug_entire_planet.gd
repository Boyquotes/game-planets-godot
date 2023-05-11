extends Node2D

# this is where we render the entire planet tilemap for debugging
# the actual playable map section scene is in game/levels/level_planet_section
# some of the logic functions used to render tilemap layers will be moved to mapmaking after testing

## inspector variables
@export var tilemap_node: TileMap
@export var tileset_source: TileSet

# from mapmaker:
var map_size = 2
var section_size = 100
var map_width = (map_size * section_size) * 4 + 1
var map_height = map_width / 2 + 1
#var map_array = []

var map_dict_from_json = {}
var file_path_name = "res://scenes/game/mapmaking/json/planet_size_2.json"

func _ready():
	print("map_width: ", map_width)
	print("map_height: ", map_height)
	var map_dict = $DebugJsonFileToDict.parse_json_file(file_path_name) # this is our dictionary (variant) parsed from our json map made in tiled
	var map_array = $DebugDictTo2dArray.dict_to_array(map_width, map_height, map_dict)
	$DebugSetTiles.set_tiles_in_tilemap(map_array, map_width, map_height, tilemap_node, tileset_source)
