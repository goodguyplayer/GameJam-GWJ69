extends Node

const SAVE_DIR = "user://"
const FILE_FORMAT = ".cfg"

var save_path = SAVE_DIR + "options_config" + FILE_FORMAT

@export var music_volume : float = 1
@export var music_enabled : bool = true
@export var audio_volume : float = 1
@export var audio_enabled : bool = true

var music_volume_default : float = 1
var music_enabled_default : bool = true
var audio_volume_default : float = 1
var audio_enabled_default : bool = true
@export var default_config : Dictionary = {
		#"ui_up" : 87,
		#"ui_left" : 65,
		#"ui_right" : 68,
		#"ui_down" : 83,
		#"ui_pause" : 80,
		#"ui_textbutton" : 16777221,
	}
	

func _ready() -> void:
	var config = ConfigFile.new()
	var err = config.load(save_path)
	if err != OK:
		reset_default()
	load_file()
		

func save_options(options_dict : Dictionary) -> void:
	var config = ConfigFile.new()
	var err = config.load(save_path)
	if err == OK:
		pass
		

func load_file() -> void:
	var config = ConfigFile.new()
	var err = config.load(save_path)
	if err == OK:
		music_volume = config.get_value("audio_music", "music_volume")
		music_enabled = config.get_value("audio_music", "music_enabled")
		audio_volume = config.get_value("audio_music", "audio_volume")
		audio_enabled = config.get_value("audio_music", "audio_enabled")
	


func reset_default() -> void:
	var config = ConfigFile.new()
	config.set_value("audio_music", "music_volume", music_volume_default)
	config.set_value("audio_music", "music_enabled", music_enabled_default)
	config.set_value("audio_music", "audio_volume", audio_volume_default)
	config.set_value("audio_music", "audio_enabled", audio_enabled_default)
	# Save inputs
	config.save(save_path)
	
