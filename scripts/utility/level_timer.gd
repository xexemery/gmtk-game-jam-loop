extends CanvasLayer


@onready var timer: Timer = $Timer


func _on_timer_timeout() -> void:
	get_tree().call_deferred("reload_current_scene")
