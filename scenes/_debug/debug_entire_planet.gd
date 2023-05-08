extends Node2D

# this is where we render the entire planet tilemap for debugging
# the actual playable map section scene is in game/levels/level_planet_section
# some of the logic functions used to render tilemap layers will be moved to mapmaking after testing

## tilemap node
@export var tilemap_node: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
