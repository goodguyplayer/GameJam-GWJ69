extends Node

const SAVE_DIR = "user://"
const FILE_FORMAT = ".cfg"

var save_path = SAVE_DIR + "options_config" + FILE_FORMAT

@export var music_volume : float = 1
@export var music_enabled : bool = true
@export var audio_volume : float = 1
@export var audio_enabled : bool = true
@export var graphics_simple : bool = false
@export var input_array : Array[String] = [
	"input_left",
	"input_right",
	"input_dash",
	"input_pause",
]

var music_volume_default : float = 1
var music_enabled_default : bool = true
var audio_volume_default : float = 1
var audio_enabled_default : bool = true
var graphics_simple_default : bool = false
@export var default_config : Dictionary = {
		"input_left" : KEY_A,
		"input_right" : KEY_D,
		"input_dash" : KEY_SHIFT,
		"input_pause" : KEY_ESCAPE,
	}
	

func _ready() -> void:
	var config = ConfigFile.new()
	var err = config.load(save_path)
	if err != OK:
		reset_default()
	load_file()
		

func save_options() -> void:
	var config = ConfigFile.new()
	var err = config.load(save_path)
	if err == OK:
		config.set_value("audio_music", "music_volume", music_volume)
		config.set_value("audio_music", "music_enabled", music_enabled)
		config.set_value("audio_music", "audio_volume", audio_volume)
		config.set_value("audio_music", "audio_enabled", audio_enabled)
		
		config.set_value("graphics", "graphics_simple", graphics_simple)
		for i in input_array:
			save_input(i, config)
		# Save inputs
		config.save(save_path)
		

func load_file() -> void:
	var config = ConfigFile.new()
	var err = config.load(save_path)
	if err == OK:
		music_volume = config.get_value("audio_music", "music_volume")
		music_enabled = config.get_value("audio_music", "music_enabled")
		audio_volume = config.get_value("audio_music", "audio_volume")
		audio_enabled = config.get_value("audio_music", "audio_enabled")
		
		graphics_simple = config.get_value("graphics", "graphics_simple")
		
		for i in input_array:
			load_input(i, config)
	


func reset_default() -> void:
	var config = ConfigFile.new()
	var err = config.load(save_path)
	if err == OK:
		config.clear()
	config.set_value("audio_music", "music_volume", music_volume_default)
	config.set_value("audio_music", "music_enabled", music_enabled_default)
	config.set_value("audio_music", "audio_volume", audio_volume_default)
	config.set_value("audio_music", "audio_enabled", audio_enabled_default)
	
	config.set_value("graphics", "graphics_simple", graphics_simple_default)
	# Save inputs
	for i in input_array:
		config.set_value("inputs", i, default_config[i])
	
	config.save(save_path)
	

func save_input(action_name, config_link : ConfigFile) -> void:
	var save_input_event = InputMap.action_get_events(action_name)[0]
	config_link.set_value("inputs", action_name, save_input_event.keycode)
	
	

func load_input(action_name, config_link : ConfigFile) -> void:
	var load_input_event = InputEventKey.new()
	load_input_event.keycode = config_link.get_value("inputs", action_name)
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, load_input_event)
