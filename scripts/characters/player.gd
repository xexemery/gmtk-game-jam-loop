class_name Player
extends Character


@onready var ray_cast: RayCast2D = $RayCast2D

const SPEED = 60.0
const JUMP_VELOCITY = -230.0

var direction: float


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
		ray_cast.target_position = Vector2(8, 0)
	elif direction < 0:
		animated_sprite.flip_h = true
		ray_cast.target_position = Vector2(-8, 0)

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


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and ray_cast.get_collider() is Mirror:
		ray_cast.get_collider().interact()
		set_sprite(Sprite.RED)
