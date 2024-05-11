extends Control

@onready var title : Label = $MarginContainer/HBoxContainer/VBoxContainer2/Title
@onready var subtitle : Label = $MarginContainer/HBoxContainer/VBoxContainer2/Subtitle
@onready var subsubtitle : Label = $MarginContainer/HBoxContainer/VBoxContainer2/Subsubtitle

const START_PATH = "res://Scenes/Stage/main_game_stage.tscn"
const OPTIONS_PATH = "res://Menu/Options/options.tscn"
const CREDITS_PATH = "res://Menu/Credits/credits.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.has_feature("debug"):
		subsubtitle.text = "DEBUG MODE ACTIVATED"
	elif OS.has_feature("release"):
		subsubtitle.text = "BUILD VERSION - "
		if OS.has_feature("Windows"):
			subsubtitle.text += "WINDOWS"
		if OS.has_feature("X11"):
			subsubtitle.text += "LINUX"
		if OS.has_feature("OSX"):
			subsubtitle.text += "MACOS"
		if OS.has_feature("HTML5"):
			subsubtitle.text += "WEB BROWSER"


func _on_start_pressed():
	#var start_options = load(START_PATH).instantiate()
	#get_tree().current_scene.add_child(start_options)
	get_tree().change_scene_to_file(START_PATH)


func _on_options_pressed():
	var options = load(OPTIONS_PATH).instantiate()
	get_tree().current_scene.add_child(options)


func _on_credits_pressed():
	var credits = load(CREDITS_PATH).instantiate()
	get_tree().current_scene.add_child(credits)


func _on_exit_pressed():
	get_tree().quit()
