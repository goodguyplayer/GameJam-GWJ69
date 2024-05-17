extends Control

@onready var highscore : Label = $Panel/VBoxContainer/HBoxContainer/highscore
@onready var currentscore : Label = $Panel/VBoxContainer/HBoxContainer2/currentscore

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalsAutoload.score_changed.connect(score_update)


func score_update(new_current, new_high) -> void:
	currentscore.text = str(new_current)
	currentscore.text += easter_egg_check(new_current)
	highscore.text = str(new_high)
	highscore.text += easter_egg_check(new_high)


func easter_egg_check(value : int) -> String:
	if str(value).find("69") != -1:
		return " Nice"
	return ""
