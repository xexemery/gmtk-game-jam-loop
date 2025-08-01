extends Area2D


@onready var closed: Sprite2D = $Closed
@onready var open: Sprite2D = $Open
@onready var collision_shape_closed: CollisionShape2D = $CollisionShapeClosed
@onready var collision_shape_open: CollisionShape2D = $CollisionShapeOpen
@onready var lock: Sprite2D = $Lock


func _ready() -> void:
	open.hide()
	closed.show()
	collision_shape_open.disabled = true
	collision_shape_closed.disabled = false
	lock.hide()


func open_door() -> void:
	closed.hide()
	open.show()
	collision_shape_open.disabled = false
	collision_shape_closed.disabled = true


func _on_body_entered(body: Node2D) -> void:
	if body is not Player:
		return

	if collision_shape_open.disabled:
		lock.show()
	else:
		print("next level")


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		lock.hide()
