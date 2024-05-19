class_name MusicPlayer
extends Node2D

@onready var audio_stream_player : AudioStreamPlayer = $AudioStreamPlayer

var song_array : Array[String] = [
	"res://Assets/Music/Billy's Sacrifice.mp3",
	"res://Assets/Music/Checking Manifest.mp3",
	"res://Assets/Music/Crash Landing.mp3",
	"res://Assets/Music/DOS-88 - Automatav2.mp3",
	"res://Assets/Music/DOS-88 - City Stomper.mp3", 
	"res://Assets/Music/DOS-88 - Far away.mp3", 
	"res://Assets/Music/Parabola.mp3",
	"res://Assets/Music/Race to Mars.mp3", 
	"res://Assets/Music/Smooth Sailing.mp3"
]


func _ready():
	if OptionsAutoload.music_enabled:
		audio_stream_player.volume_db = linear_to_db(OptionsAutoload.music_volume)
	else:
		queue_free()
	choose_random_song()
	

func choose_random_song() -> void:
	var music_picker : RandomNumberGenerator = RandomizerAutoload.rng
	var next_song : AudioStream
	while true:
		next_song = load(song_array[music_picker.randi_range(0, len(song_array) - 1)])
		audio_stream_player.stream = next_song
		audio_stream_player.play()
		await audio_stream_player.finished

