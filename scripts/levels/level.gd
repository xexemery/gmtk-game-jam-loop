class_name Level
extends Node2D


@onready var foreground: TileMapLayer = $Foreground
@onready var foreground_alt: TileMapLayer = $ForegroundAlt


func _ready() -> void:
	if GameManager.is_alt:
		foreground.enabled = false
		foreground_alt.enabled = true
	else:
		foreground.enabled = true
		foreground_alt.enabled = false
