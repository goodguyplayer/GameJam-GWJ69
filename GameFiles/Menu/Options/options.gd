extends Control





func _on_return_pressed():
	queue_free()


func _on_save_pressed():
	pass # Replace with function body.


func _on_save_return_pressed():

	queue_free()


func _on_discard_pressed():
	pass # Replace with function body.


func _on_clear_pressed():
	OptionsAutoload.reset_default()
