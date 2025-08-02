class_name Player
extends Character


@onready var ray_cast: RayCast2D = $RayCast2D
@onready var coyote_timer: Timer = $CoyoteTimer

const SPEED = 60.0
const JUMP_VELOCITY = -230.0

var direction: float
var coyote_time_activated: bool = false


func _physics_process(delta: float) -> void:
	# Add the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if (
		Input.is_action_just_pressed("jump") and
		(is_on_floor() or not coyote_timer.is_stopped()) and
		not GameManager.in_final_scene
	):
		velocity.y = JUMP_VELOCITY
		coyote_timer.stop()
		coyote_time_activated = true

	# Get the input direction: -1, 0, 1
	direction = Input.get_axis("left", "right")

	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
		ray_cast.target_position = Vector2(8, 0)
	elif direction < 0:
		animated_sprite.flip_h = true
		ray_cast.target_position = Vector2(-8, 0)

	# Play animations
	if is_on_floor():
		if Input.is_action_pressed("down"):
			direction = 0
			animated_sprite.play("crouch")
		elif direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")

		if coyote_time_activated:
			coyote_time_activated = false
			coyote_timer.stop()
	else:
		animated_sprite.play("jump")

		if not coyote_time_activated:
			coyote_timer.start()
			coyote_time_activated = true

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
