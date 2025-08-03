extends Node


@onready var happy: AudioStreamPlayer = $Happy
@onready var text: AudioStreamPlayer = $Text
@onready var platforming_slow: AudioStreamPlayer = $PlatformingSlow
@onready var platforming_fast: AudioStreamPlayer = $PlatformingFast


func play_happy() -> void:
	happy.play()


func stop_happy() -> void:
	happy.stop()


func play_text() -> void:
	text.play()


func stop_text() -> void:
	text.stop()


func play_platforming_slow() -> void:
	platforming_slow.play()


func stop_platforming_slow() -> void:
	platforming_slow.stop()


func play_platforming_fast() -> void:
	platforming_fast.play()


func stop_platforming_fast() -> void:
	platforming_fast.stop()
