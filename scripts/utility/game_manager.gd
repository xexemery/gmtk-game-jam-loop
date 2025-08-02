extends Node


const FILE_PATH: String = "res://scenes/levels/level_"
const FILE_EXTENSION: String = ".tscn"
const FILE_EXTENSION_ALT: String = "_alt.tscn"

var current_extension: String
var is_alt: bool
var in_final_scene: bool


func _ready() -> void:
	current_extension = FILE_EXTENSION
	is_alt = false
	in_final_scene = false


func new_level() -> void:
	var current_scene_file: String = get_tree().current_scene.scene_file_path
	var next_level_number: int = current_scene_file.to_int() + 1

	if next_level_number == 11:
		in_final_scene = true

	if next_level_number == 12:
		next_level_number = 0

	var next_level_path: String = FILE_PATH + str(next_level_number) + current_extension
	get_tree().call_deferred("change_scene_to_file", next_level_path)


func change_to_alt() -> void:
	current_extension = FILE_EXTENSION_ALT
	is_alt = true
	in_final_scene = false
