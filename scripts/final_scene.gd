extends Node2D


@onready var text_box: CanvasLayer = %TextBox
@onready var first_area: Area2D = $FirstArea
@onready var second_area: Area2D = $SecondArea
@onready var third_area: Area2D = $ThirdArea
@onready var animation_player: AnimationPlayer = $Reflection/AnimationPlayer


func _ready() -> void:
	animation_player.play("RESET")


func _on_first_area_entered(body: Node2D) -> void:
	if body is not Player:
		return

	body.animated_sprite.play("idle")
	text_box.queue_text("4...")
	text_box.queue_text("3...")
	text_box.queue_text("2...")
	text_box.queue_text("1...")
	text_box.queue_text("Happy New Year!!")


func _on_second_area_entered(body: Node2D) -> void:
	if body is not Player:
		return

	body.animated_sprite.play("idle")
	# add bounces to party guy
	text_box.queue_text("Max?")
	text_box.queue_text("Hey!")
	text_box.queue_text("Sick fit!")
	text_box.queue_text("...")
	# move closer, music stops/changes
	text_box.queue_text("Take a look.")


func _on_third_area_entered(body: Node2D) -> void:
	if body is not Player:
		return

	body.animated_sprite.play("idle")
	get_tree().paused = true
	animation_player.play("fade_in")
	await animation_player.animation_finished

	text_box.queue_text("Hey.", 1)
	text_box.queue_text("Hey.", 2)
	text_box.queue_text("Why the long face?", 2)
	text_box.queue_text("People keep changing...", 1)
	text_box.queue_text("Is that such a bad thing?", 2)
	text_box.queue_text("I mean...", 1)
	text_box.queue_text("What, you wanna stay here?", 2)
	text_box.queue_text("These people were having fun...", 1)
	text_box.queue_text("These people... are stuck in the past", 2)

	# then play convo with partner character
