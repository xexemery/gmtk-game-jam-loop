extends Level


@onready var text_box: CanvasLayer = %TextBox
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: Player = $Player
@onready var companion: Companion = $Companion
@onready var third: Third = $Third
@onready var fourth: Fourth = $Fourth

var current_color: int
var next_color: int
var fourth_color_one: int
var fourth_color_two: int


func _ready() -> void:
	super()
	animation_player.play("RESET")
	get_tree().paused = true

	if GameManager.is_alt:
		current_color = 1
		next_color = 0
		fourth_color_one = 3
		fourth_color_two = 2
	else:
		current_color = 0
		next_color = 1
		fourth_color_one = 2
		fourth_color_two = 3

	TransitionScreen.fade_to_normal()
	await TransitionScreen.transition_finished
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

	fourth.set_sprite(fourth_color_one)
	fourth.animated_sprite.play("run")
	third.animated_sprite.flip_h = true
	fourth.animated_sprite.flip_h = true

	await get_tree().create_timer(0.5).timeout
	animation_player.play_backwards("walk")
	await animation_player.animation_finished

	third.animated_sprite.play("idle")
	fourth.animated_sprite.play("idle")
	await get_tree().create_timer(1.0).timeout
	_second_text()


func _second_text() -> void:
	animation_player.play("zoom_in")
	await animation_player.animation_finished

	player.animated_sprite.flip_h = true
	text_box.queue_text("Who is that?", current_color)
	text_box.queue_text("What do you mean?")
	text_box.queue_text("She's not even the same color!", current_color)
	text_box.queue_text("But she's the same shape?")
	text_box.queue_text("Hold on.", current_color)

	fourth.set_sprite(fourth_color_two)
	fourth.animated_sprite.flip_h = true
	await text_box.text_finished

	player.animated_sprite.flip_h = false
	animation_player.play("zoom_out")
	await animation_player.animation_finished

	companion.set_sprite(next_color)
	await get_tree().create_timer(1.2).timeout

	animation_player.play_backwards("zoom_out")
	player.animated_sprite.flip_h = true
	await animation_player.animation_finished

	text_box.queue_text("You're not gonna-", current_color)
	text_box.queue_text("What's wrong?")
	text_box.queue_text("No I uh...", current_color)

	third.set_sprite(next_color)
	fourth.set_sprite(next_color)
	third.animated_sprite.flip_h = true
	fourth.animated_sprite.flip_h = true
	await text_box.text_finished

	player.animated_sprite.flip_h = false
	animation_player.play("zoom_out")
	await animation_player.animation_finished

	text_box.queue_text("'Sup dude?")
	await text_box.text_finished

	animation_player.play("final_zoom")
	await animation_player.animation_finished

	player.animated_sprite.play("run")
	animation_player.play("run_away")

	await animation_player.animation_finished
	TransitionScreen.fade_to_black()

	await TransitionScreen.transition_finished
	GameManager.new_level()
