extends Node2D


@onready var text_box: CanvasLayer = %TextBox
@onready var first_area: Area2D = $FirstArea
@onready var second_area: Area2D = $SecondArea
@onready var third_area: Area2D = $ThirdArea


func _on_first_area_entered(body: Node2D) -> void:
	if body is Player:
		text_box.queue_text("3...")
		text_box.queue_text("2...")
		text_box.queue_text("1...")
		text_box.queue_text("Happy New Year!!")


func _on_second_area_entered(body: Node2D) -> void:
	if body is Player:
		text_box.queue_text("Oh hey man")


func _on_third_area_entered(body: Node2D) -> void:
	if body is Player:
		text_box.queue_text("Why the long face?")
		text_box.queue_text("People keep changing...")
		text_box.queue_text("Is that such a bad thing?")
		text_box.queue_text("I mean...")
		text_box.queue_text("What, you wanna stay here?")
		text_box.queue_text("These people were having fun...")
		text_box.queue_text("These people... are stuck in the past")
