extends CanvasLayer


@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer


signal transition_finished


func _ready() -> void:
	animation_player.animation_finished.connect(_on_animation_finished)
	color_rect.hide()


func _on_animation_finished(animation_name: String) -> void:
	if animation_name == "fade_to_black":
		transition_finished.emit()
	elif animation_name == "fade_to_normal":
		transition_finished.emit()
		color_rect.hide()


func fade_to_black() -> void:
	color_rect.show()
	animation_player.play("fade_to_black")


func fade_to_normal() -> void:
	color_rect.show()
	animation_player.play("fade_to_normal")
