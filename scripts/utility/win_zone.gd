extends Area2D


@onready var timer: Timer = $Timer

const FILE_PATH: String = "res://scenes/levels/level_"
const FILE_EXTENSION: String = ".tscn"


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		timer.start()


func _on_timer_timeout() -> void:
	var current_scene_file: String = get_tree().current_scene.scene_file_path
	var next_level_number: int = current_scene_file.to_int() + 1

	var next_level_path: String = FILE_PATH + str(next_level_number) + FILE_EXTENSION
	get_tree().call_deferred("change_scene_to_file", next_level_path)
