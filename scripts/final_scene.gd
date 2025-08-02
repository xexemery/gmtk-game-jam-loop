extends Node2D


@onready var text_box: CanvasLayer = %TextBox
@onready var area: Area2D = $Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		text_box.queue_text("Hello")
