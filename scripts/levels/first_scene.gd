extends Level


@onready var text_box: CanvasLayer = %TextBox
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var third: Third = $Third
@onready var fourth: Fourth = $Fourth


func _ready() -> void:
	animation_player.play("RESET")
	_first_text()


func _first_text() -> void:
	text_box.queue_text("Watching our 3rd wheel find the 4th")
	await text_box.text_finished

	animation_player.play("heart_fade_in")
	await animation_player.animation_finished

	text_box.queue_text("They've got chemistry...")
	await text_box.text_finished

	animation_player.play_backwards("heart_fade_in")
	await animation_player.animation_finished
	_walk()


func _walk() -> void:
	third.animated_sprite.play("run")
	fourth.animated_sprite.play("run")
	animation_player.play("walk")
	await animation_player.animation_finished

	fourth.set_sprite(2)
	third.animated_sprite.flip_h = true
	fourth.animated_sprite.flip_h = true
	animation_player.play_backwards("walk")
	await animation_player.animation_finished

	third.animated_sprite.play("idle")
	fourth.animated_sprite.play("idle")
