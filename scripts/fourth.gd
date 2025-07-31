extends Character
class_name Fourth


@onready var animated_sprite_green: AnimatedSprite2D = $AnimatedSpriteGreen
@onready var animated_sprite_grey: AnimatedSprite2D = $AnimatedSpriteGrey


func set_sprite(sprite: Sprite) -> void:
	animated_sprite_blue.hide()
	animated_sprite_red.hide()
	animated_sprite_green.hide()
	animated_sprite_grey.hide()

	match sprite:
		Sprite.BLUE:
			animated_sprite_blue.show()
			current_state = Sprite.BLUE
			animated_sprite = animated_sprite_blue
		Sprite.RED:
			animated_sprite_red.show()
			current_state = Sprite.RED
			animated_sprite = animated_sprite_red
		Sprite.GREEN:
			animated_sprite_green.show()
			current_state = Sprite.GREEN
			animated_sprite = animated_sprite_green
		Sprite.GREY:
			animated_sprite_grey.show()
			current_state = Sprite.GREY
			animated_sprite = animated_sprite_grey
