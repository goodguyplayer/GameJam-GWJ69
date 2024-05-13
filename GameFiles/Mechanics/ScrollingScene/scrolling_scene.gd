extends Node2D

@onready var shader_material = preload("res://Mechanics/ScrollingScene/background_shader.tres")
@onready var sprite_2d : Sprite2D = $Sprite2D


func _ready():
	if OptionsAutoload.graphics_simple:
		sprite_2d.material = shader_material

