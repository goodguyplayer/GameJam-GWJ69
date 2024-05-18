class_name ScoreIncrease
extends Action

signal new_score(score)
var how_much : int = 0

func _ready():
	how_much = RandomizerAutoload.rng.randi_range(20, 80)
	new_score.emit(how_much)

func execute() -> void:
	SignalsAutoload.score_increase.emit(how_much)
	
