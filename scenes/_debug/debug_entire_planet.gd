extends Node2D

# this is where we render the entire planet tilemap for debugging
# the actual playable map section scene is in game/levels/level_planet_section
# some of the logic functions used to render tilemap layers will be moved to mapmaking after testing

## tilemap node
@export var tilemap_node: Node

var map_dict_from_json = {}
var file_path_name = "res://scenes/game/mapmaking/json/planet_size_2.json"

func _ready():
	var get_json = $DebugJsonFileToDict.parse_json_file(file_path_name) # this is our dictionary parsed from our json map made in tiled
	print(typeof(get_json)) # variant (dictionary)
