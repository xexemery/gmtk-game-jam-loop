class_name Character
extends CharacterBody2D


@onready var animated_sprite_blue: AnimatedSprite2D = $AnimatedSpriteBlue
@onready var animated_sprite_red: AnimatedSprite2D = $AnimatedSpriteRed

var animated_sprite: AnimatedSprite2D

enum Sprite {
	BLUE,
	RED,
	GREEN,
	GREY
}

var current_state: Sprite


func _ready() -> void:
	if GameManager.is_alt:
		set_sprite(Sprite.RED)
	else:
		set_sprite(Sprite.BLUE)


func set_sprite(sprite: Sprite) -> void:
	match sprite:
		Sprite.BLUE:
			animated_sprite_red.hide()
			animated_sprite_blue.show()
			current_state = Sprite.BLUE
			animated_sprite = animated_sprite_blue
		Sprite.RED:
			animated_sprite_blue.hide()
			animated_sprite_red.show()
			current_state = Sprite.RED
			animated_sprite = animated_sprite_red
