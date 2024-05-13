extends Control


@onready var enable_shaders : CheckBox = $MarginContainer/VBoxContainer/TabContainer/Graphics/VBoxContainer/EnableShaders
@onready var enable_audio : CheckBox = $MarginContainer/VBoxContainer/TabContainer/Audio/VBoxContainer/EnableAudio
@onready var enable_music : CheckBox = $MarginContainer/VBoxContainer/TabContainer/Audio/VBoxContainer/EnableMusic

@onready var audio_slider : HSlider = $MarginContainer/VBoxContainer/TabContainer/Audio/VBoxContainer/AudioSlider/Audio
@onready var audio_percent : Label = $MarginContainer/VBoxContainer/TabContainer/Audio/VBoxContainer/AudioSlider/Label2

@onready var music_slider : HSlider = $MarginContainer/VBoxContainer/TabContainer/Audio/VBoxContainer/MusicSlider/Music
@onready var music_percent : Label = $MarginContainer/VBoxContainer/TabContainer/Audio/VBoxContainer/MusicSlider/Label2


func _ready():
	enable_shaders.button_pressed = OptionsAutoload.graphics_simple
	enable_audio.button_pressed = OptionsAutoload.audio_enabled
	enable_music.button_pressed = OptionsAutoload.music_enabled
	
	audio_slider.value = OptionsAutoload.audio_volume
	music_slider.value = OptionsAutoload.music_volume
	
	audio_percent.text = str(audio_slider.value) + "%"
	music_percent.text = str(music_slider.value) + "%"


func _on_return_pressed():
	queue_free()


func _on_save_pressed():
	OptionsAutoload.save_options()


func _on_save_return_pressed():
	OptionsAutoload.save_options()
	queue_free()


func _on_discard_pressed():
	OptionsAutoload.reset_default()
	OptionsAutoload.load_file()
	queue_free()


func _on_clear_pressed():
	OptionsAutoload.reset_default()
	OptionsAutoload.load_file()
	get_tree().reload_current_scene()


func _on_enable_shaders_toggled(toggled_on):
	OptionsAutoload.graphics_simple = toggled_on


func _on_enable_music_toggled(toggled_on):
	OptionsAutoload.music_enabled = toggled_on


func _on_enable_audio_toggled(toggled_on):
	OptionsAutoload.audio_enabled = toggled_on


func _on_audio_value_changed(value):
	audio_percent.text = str(value) + "%"
	OptionsAutoload.audio_volume = value


func _on_music_value_changed(value):
	music_percent.text = str(value) + "%"
	OptionsAutoload.music_volume = value
