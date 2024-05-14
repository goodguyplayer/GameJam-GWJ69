class_name ScoreIncrease
extends Action

func execute() -> void:
	var how_much : int = RandomizerAutoload.rng.randi_range(20, 80)
	SignalsAutoload.score_increase.emit(how_much)
