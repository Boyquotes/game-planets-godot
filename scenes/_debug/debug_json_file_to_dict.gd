extends Node2D

# function that takes in json file path string and returns 

func parse_json_file(file_path_name):
#	var fileName = "res://scenes/game/mapmaking/json/planet_size_2.json"
	var file = FileAccess.open(file_path_name, FileAccess.READ)
	var contents = file.get_as_text()
	file.close()
	var json = JSON.new()
#	return json.parse(contents)
#	var test = 666
#	return test
	var json_string = JSON.parse_string(contents)
#	var parse_result = json.parse(json_string) # "cannot convert ... from dictionary to string"
	return json_string
