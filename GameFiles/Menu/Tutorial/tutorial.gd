extends Control

@onready var swing : Label = $MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer/Swing
@onready var dash : Label  = $MarginContainer/ScrollContainer/VBoxContainer/Dash3/Dash


func _ready():
	#swing.text = swing_text % [display_current_key("input_left"), display_current_key("input_right")]
	swing.text = swing.text % [display_current_key("input_left"), display_current_key("input_right")]
	dash.text = dash.text % [display_current_key("input_dash")]


func display_current_key(action : String):
	var current_key = InputMap.action_get_events(action)[0].as_text()
	return "%s Key" % current_key


func _on_button_pressed():
	queue_free()
