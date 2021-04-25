extends Node

const SAVE_DATA_PATH = "res://debug/save/save_data.json"
#const SAVE_DATA_PATH = "user://save_data.json"
var save_data = {
	highscore = 0
}

func save_data(save_data):
	var json_string = to_json(save_data)
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_string)
	save_file.close()

func load_data():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return save_data

	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text())
	save_file.close()
	return save_data
