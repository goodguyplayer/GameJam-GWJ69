class_name AudioManager
extends Node2D

@onready var audio_stream_player : AudioStreamPlayer = $AudioStreamPlayer

const COLLECTED_SOUND : String = "res://Assets/Music/Fruit collect 1.wav"
const HIT_SOUND : String = "res://Assets/Music/Hit damage 1.wav"
const GAME_OVER_SOUND : String = "res://Assets/Music/Boss hit 1.wav"

# Called when the node enters the scene tree for the first time.
func _ready():
	if OptionsAutoload.audio_enabled:
		audio_stream_player.volume_db =  linear_to_db(OptionsAutoload.audio_volume / 100)
	else:
		queue_free()
	SignalsAutoload.score_increase.connect(player_collected_item)
	SignalsAutoload.player_health_changed.connect(player_health_changed)
	SignalsAutoload.player_fell.connect(player_fell)


func player_fell() -> void:
	_play_audio(GAME_OVER_SOUND)


func player_health_changed(_value_one, _value_two) -> void:
	_play_audio(HIT_SOUND)


func player_collected_item(_value) -> void:
	_play_audio(COLLECTED_SOUND)


func _play_audio(stream_name) -> void:
	var audio_to_play : AudioStream = load(stream_name)
	audio_stream_player.stream = audio_to_play
	audio_stream_player.play()
