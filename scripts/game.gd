extends Node2D


const FILE_PATH: String = "res://scenes/levels/level_0.tscn"


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		_start_game()


func _start_game() -> void:
	get_tree().call_deferred("change_scene_to_file", FILE_PATH)
