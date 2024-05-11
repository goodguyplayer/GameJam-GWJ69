extends Control

const MENU_PATH : String = "res://Menu/MainMenu/main_menu.tscn"


func _input(event):
	if event.is_action_pressed("input_pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state

func _on_return_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file(MENU_PATH)


func _on_resume_pressed():
	get_tree().paused = false
	visible = false
