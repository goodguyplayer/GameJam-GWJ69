extends Control





func _on_return_pressed():
	queue_free()


func _on_save_pressed():
	OptionsAutoload.save_options()


func _on_save_return_pressed():
	OptionsAutoload.save_options()
	queue_free()


func _on_discard_pressed():
	OptionsAutoload.reset_default()
	OptionsAutoload.load_file()
	queue_free()


func _on_clear_pressed():
	OptionsAutoload.reset_default()
	OptionsAutoload.load_file()
	get_tree().reload_current_scene()
