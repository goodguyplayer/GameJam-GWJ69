extends Button


@export var action : String = "default_input"


func _ready():
	assert(InputMap.has_action(action))
	set_process_unhandled_input(false)
	display_current_key()
	
	
func _toggled(button_pressed):
	set_process_unhandled_input(button_pressed)
	if button_pressed:
		text = "... Key"
		release_focus()
	else:
		display_current_key()
		
		
func _unhandled_input(event):
	if event is InputEventKey:
		remap_action_to(event)


func remap_action_to(event):
	var original_actions = InputMap.action_get_events(action)
	InputMap.action_erase_events(action)
	InputMap.action_add_event(action, event)
	display_current_key()
	button_pressed = false


func display_current_key():
	var current_key = InputMap.action_get_events(action)[0].as_text()
	text = "%s Key" % current_key
