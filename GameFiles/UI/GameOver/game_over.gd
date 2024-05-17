extends Control

const MENU_PATH : String = "res://Menu/MainMenu/main_menu.tscn"

@onready var current_score_label : Label = $MarginContainer/Panel/VBoxContainer/CurrentScore
@onready var hight_score_label : Label = $MarginContainer/Panel/VBoxContainer/HightScore
@onready var new_high_score_label : Label = $MarginContainer/Panel/VBoxContainer/NewHighScore


func _ready():
	SignalsAutoload.player_fell.connect(game_over)
	SignalsAutoload.score_final.connect(update_final_score)


func game_over() -> void:
	visible = true


func update_final_score(current_score, highscore, is_new_highscore) -> void:
	current_score_label.text = current_score_label.text % [str(current_score)]
	hight_score_label.text = hight_score_label.text % [str(highscore)]
	if is_new_highscore:
		new_high_score_label.visible = true


func _on_try_again_pressed():
	get_tree().reload_current_scene()


func _on_return_menu_pressed():
	get_tree().change_scene_to_file(MENU_PATH)
