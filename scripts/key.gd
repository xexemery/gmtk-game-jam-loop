extends Area2D


@onready var door: Area2D = %Door


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		door.call_deferred("open_door")
		queue_free()
