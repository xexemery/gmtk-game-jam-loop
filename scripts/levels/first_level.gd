extends Level


func _ready() -> void:
	super()

	if GameManager.is_alt:
		AudioManager.play_platforming_fast()
	else:
		AudioManager.play_platforming_slow()

	TransitionScreen.fade_to_normal()
	await TransitionScreen.transition_finished
	get_tree().paused = false
