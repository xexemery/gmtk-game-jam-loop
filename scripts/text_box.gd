extends CanvasLayer


@onready var text_box_container: MarginContainer = $TextBoxContainer
@onready var start_symbol: Label = $TextBoxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol: Label = $TextBoxContainer/MarginContainer/HBoxContainer/End
@onready var label: Label = $TextBoxContainer/MarginContainer/HBoxContainer/Label
@onready var panel: Panel = $TextBoxContainer/Panel

const CHAR_READ_RATE = 0.05
var text_tween: Tween
var duration: float

enum State {
	READY,
	READING,
	FINISHED
}

enum TextColor {
	WHITE,
	BLUE,
	RED
}

var current_state: State = State.READY
var text_queue: Array[String] = []
var color_queue: Array[TextColor] = []


signal text_finished()


func _ready() -> void:
	_hide_text_box()


func _process(_delta: float) -> void:
	match current_state:
		State.READY:
			if not text_queue.is_empty():
				get_tree().paused = true
				_display_text()
		State.READING:
			if Input.is_action_just_pressed("interact"):
				label.visible_ratio = 1.0
				text_tween.kill()
				_on_text_finished()
		State.FINISHED:
			if Input.is_action_just_pressed("interact"):
				_change_state(State.READY)
				if text_queue.is_empty():
					_hide_text_box()


func queue_text(next_text: String, next_color: TextColor = TextColor.WHITE) -> void:
	text_queue.push_back(next_text)
	color_queue.push_back(next_color)


func _hide_text_box() -> void:
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""

	text_box_container.hide()
	get_tree().paused = false
	text_finished.emit()


func _show_text_box() -> void:
	start_symbol.text = ">"
	text_box_container.show()


func _display_text() -> void:
	var next_text: String = text_queue.pop_front()
	var next_color: Color = _get_color(color_queue.pop_front())

	start_symbol.add_theme_color_override("font_color", next_color)
	end_symbol.add_theme_color_override("font_color", next_color)
	panel.get_theme_stylebox("panel").border_color = next_color

	label.text = next_text
	label.visible_ratio = 0.0
	_change_state(State.READING)
	_show_text_box()

	text_tween = create_tween()
	duration = len(next_text) * CHAR_READ_RATE
	text_tween.tween_property(label, "visible_ratio", 1.0, duration)
	text_tween.connect("finished", _on_text_finished)


func _get_color(text_color: TextColor) -> Color:
	match text_color:
		TextColor.BLUE:
			return Color(0.161, 0.678, 1.0)
		TextColor.RED:
			return Color(1.0, 0.0, 0.302)
		_:
			return Color(1.0, 0.945, 0.91)


func _on_text_finished() -> void:
	end_symbol.text = "..."
	_change_state(State.FINISHED)


func _change_state(next_state) -> void:
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to State.READY")
		State.READING:
			print("Changing state to State.READING")
		State.FINISHED:
			print("Changing state to State.FINISHED")
