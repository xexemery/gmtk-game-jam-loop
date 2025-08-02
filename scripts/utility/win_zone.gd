extends Area2D


@onready var timer: Timer = $Timer

const FILE_PATH: String = "res://scenes/levels/level_"
const FILE_EXTENSION: String = ".tscn"


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		timer.start()


func _on_timer_timeout() -> void:
	GameManager.new_level()
