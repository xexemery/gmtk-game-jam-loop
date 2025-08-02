class_name Mirror
extends StaticBody2D


@onready var text_box: CanvasLayer = %TextBox


func interact() -> void:
	text_box.queue_text("Why the long face?")
	text_box.queue_text("People keep changing...")
	text_box.queue_text("Is that such a bad thing?")
	text_box.queue_text("I mean...")
	text_box.queue_text("What, you wanna stay here?")
	text_box.queue_text("These people were having fun...")
	text_box.queue_text("These people... are stuck in the past")
