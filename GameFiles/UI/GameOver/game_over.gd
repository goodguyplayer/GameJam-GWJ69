extends Control

const MENU_PATH : String = "res://Menu/MainMenu/main_menu.tscn"


func _ready():
	SignalsAutoload.player_fell.connect(game_over)


func game_over() -> void:
	visible = true


func _on_try_again_pressed():
	get_tree().reload_current_scene()


func _on_return_menu_pressed():
	get_tree().change_scene_to_file(MENU_PATH)
