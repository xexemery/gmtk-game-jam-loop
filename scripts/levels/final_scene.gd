extends Level


@onready var text_box: CanvasLayer = %TextBox
@onready var first_area: Area2D = $FirstArea
@onready var second_area: Area2D = $SecondArea
@onready var third_area: Area2D = $ThirdArea
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var camera: Camera2D = $Camera2D
@onready var player: Player = $Player
@onready var companion: Companion = $Companion

var animation_name: String
var self_color: int
var reflection_color: int


func _ready() -> void:
	super()
	camera.enabled = false
	companion.hide()
	animation_player.play("RESET")

	if GameManager.is_alt:
		animation_name = "fade_in_alt"
		self_color = 1
		reflection_color = 0
	else:
		animation_name = "fade_in"
		self_color = 0
		reflection_color = 1


func _on_first_area_entered(body: Node2D) -> void:
	if body is not Player:
		return

	body.animated_sprite.play("idle")
	_first_text()


func _on_second_area_entered(body: Node2D) -> void:
	if body is not Player:
		return

	body.animated_sprite.play("idle")
	_second_text()


func _on_third_area_entered(body: Node2D) -> void:
	if body is not Player:
		return

	body.animated_sprite.play("idle")
	get_tree().paused = true
	animation_player.play(animation_name)
	await animation_player.animation_finished
	_third_text()


func _first_text() -> void:
	text_box.queue_text("4...")
	text_box.queue_text("3...")
	text_box.queue_text("2...")
	text_box.queue_text("1...")
	text_box.queue_text("Happy New Year!!")

	await text_box.text_finished
	get_tree().paused = false


func _second_text() -> void:
	animation_player.play("bounce")

	text_box.queue_text("Max?")
	text_box.queue_text("Hey!")

	await text_box.text_finished
	animation_player.play("bounce")
	await animation_player.animation_finished

	text_box.queue_text("Sick fit!")

	# music stops/changes
	await text_box.text_finished
	animation_player.play("move_closer")
	await animation_player.animation_finished
	text_box.queue_text("...")
	text_box.queue_text("Take a look.")

	await text_box.text_finished
	get_tree().paused = false


func _third_text() -> void:
	text_box.queue_text("Hey.", self_color)
	text_box.queue_text("Hey.", reflection_color)
	text_box.queue_text("Why the long face?", reflection_color)
	text_box.queue_text("People keep changing...", self_color)
	text_box.queue_text("Is that such a bad thing?", reflection_color)
	text_box.queue_text("I mean...", self_color)
	text_box.queue_text("What, you wanna stay here?", reflection_color)
	text_box.queue_text("These people were having fun...", self_color)
	text_box.queue_text("These people... are stuck in the past.", reflection_color)

	await text_box.text_finished
	_fourth_text()


func _fourth_text() -> void:
	camera.enabled = true
	companion.show()
	text_box.queue_text("Max!")
	await text_box.text_finished

	player.animated_sprite.flip_h = true
	animation_player.play("move_partner")
	await animation_player.animation_finished

	text_box.queue_text("He's here.")
	text_box.queue_text("Did he bring his new girlfriend?", self_color)
	text_box.queue_text("Ready to meet her?")
	text_box.queue_text("I'm ready.", self_color)

	await text_box.text_finished
	companion.set_sprite(reflection_color)
	text_box.queue_text("Great!")

	await text_box.text_finished
	player.set_sprite(reflection_color)
	player.animated_sprite.flip_h = true
	text_box.queue_text("Great.", reflection_color)
	text_box.queue_text("Let's go.")

	await text_box.text_finished
	get_tree().paused = false
	GameManager.new_level()
