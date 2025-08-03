extends Level


func _ready() -> void:
	super()
	TransitionScreen.fade_to_normal()
	await TransitionScreen.transition_finished
	get_tree().paused = false
