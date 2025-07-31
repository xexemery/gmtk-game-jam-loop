extends CharacterBody2D


@onready var animated_sprite_blue: AnimatedSprite2D = $AnimatedSpriteBlue
@onready var animated_sprite_red: AnimatedSprite2D = $AnimatedSpriteRed

const SPEED = 60.0
const JUMP_VELOCITY = -200.0

var animated_sprite: AnimatedSprite2D
var direction: float

enum Sprite {
	BLUE,
	RED
}

var current_state: Sprite


func _ready() -> void:
	set_sprite(Sprite.BLUE)


func _physics_process(delta: float) -> void:
	# Add the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1, 0, 1
	direction = Input.get_axis("left", "right")

	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	if is_on_floor():
		if Input.is_action_pressed("down"):
			direction = 0
			animated_sprite.play("crouch")
		elif direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func set_sprite(sprite: Sprite) -> void:
	match sprite:
		Sprite.BLUE:
			animated_sprite_blue.show()
			animated_sprite_red.hide()
			current_state = Sprite.BLUE
			animated_sprite = animated_sprite_blue
		Sprite.RED:
			animated_sprite_red.show()
			animated_sprite_blue.hide()
			current_state = Sprite.RED
			animated_sprite = animated_sprite_red
