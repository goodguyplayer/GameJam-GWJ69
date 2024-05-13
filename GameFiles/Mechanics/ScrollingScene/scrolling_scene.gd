extends Node2D

@onready var shader_material = preload("res://Mechanics/ScrollingScene/background_shader.tres")

func _ready():
	if !OptionsAutoload.graphics_simple:
		self.material = shader_material
#func _process(delta):
	#scroll_base_offset -= Vector2(0, 40) * delta
