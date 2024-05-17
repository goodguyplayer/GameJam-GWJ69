class_name ScoreCounter
extends Node

const SAVE_DIR = "user://"
const FILE_FORMAT = ".cfg"
const FILE_NAME = "score_config"

@onready var timer : Timer = $Timer

@export var highscore : int = 0
@export var current_score : int = 0

var config : ConfigFile
var save_path = SAVE_DIR + FILE_NAME + FILE_FORMAT
var is_new_highscore : bool = false


func _ready():
	config = ConfigFile.new()
	var err = config.load(save_path)
	if err != OK:
		save_score(0, 0)
	
	highscore = config.get_value("score", "highscore")
	current_score = 0
	SignalsAutoload.player_fell.connect(on_quit)
	SignalsAutoload.score_increase.connect(_score_increase)


func save_score(high, current) -> void:
	config.set_value("score", "highscore", high)
	config.save(save_path)
	SignalsAutoload.score_final.emit(current_score, highscore, is_new_highscore)


func on_quit() -> void:
	save_score(highscore, current_score)
	timer.stop()


func _score_increase(value) -> void:
	current_score += value
	if current_score >= highscore:
		highscore = current_score
	SignalsAutoload.score_changed.emit(current_score, highscore)


func _on_timer_timeout():
	current_score += 1
	if current_score >= highscore:
		is_new_highscore = true
		highscore = current_score
	SignalsAutoload.score_changed.emit(current_score, highscore)
	

