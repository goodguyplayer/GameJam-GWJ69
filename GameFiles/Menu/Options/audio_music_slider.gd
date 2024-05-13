extends Control

@export_enum("audio", "music") var audio_music 
@onready var name_label : Label = $HBoxContainer/Label
@onready var total_label : Label = $HBoxContainer/Label2
@onready var h_slider = $HBoxContainer/HSlider

# Called when the node enters the scene tree for the first time.
func _ready():
	if audio_music == 0:
		name_label.text = "audio"
		h_slider.value = OptionsAutoload.audio_volume
	else:
		name_label.text = "music"
		h_slider.value = OptionsAutoload.music_volume
	total_label.text = str(h_slider.value) + "%"




func _on_h_slider_value_changed(value):
	if audio_music == 0:
		name_label.text = "audio"
		OptionsAutoload.audio_volume = value
	else:
		name_label.text = "music"
		OptionsAutoload.music_volume = value
	total_label.text = str(h_slider.value) + "%"
