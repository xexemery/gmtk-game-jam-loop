extends CanvasLayer


@onready var timer: Timer = $Timer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	if GameManager.is_alt:
		timer.wait_time = 3.0
		animated_sprite.play("three")
	else:
		timer.wait_time = 5.0
		animated_sprite.play("five")


func _on_timer_timeout() -> void:
	get_tree().call_deferred("reload_current_scene")
