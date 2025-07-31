class_name Mirror
extends StaticBody2D


@onready var area: Area2D = $Area2D
@onready var label: Label = $Label


func interact() -> void:
	print("mirror")


func _on_area_entered(body: Node2D) -> void:
	if body is Player:
		label.show()


func _on_area_exited(body: Node2D) -> void:
	if body is Player:
		label.hide()
