extends Area2D


@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		timer.start()


func _on_timer_timeout() -> void:
	get_tree().call_deferred("reload_current_scene")
