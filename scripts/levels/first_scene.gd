extends Level


@onready var text_box: CanvasLayer = %TextBox


func _ready() -> void:
	text_box.queue_text("Watching our 3rd wheel find the 4th")
	text_box.queue_text("They've got chemistry...")
	text_box.queue_text('Going for a "walk"')
