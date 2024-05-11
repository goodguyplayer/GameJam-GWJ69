extends Node2D


@export var bat_reference : = "res://Mechanics/Enemies/Bat/bat.tscn"

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var marker_2d : Marker2D = $Marker2D



func start_spawning_bat():
	animation_player.play("spawn_start")


func spawn_bat():
	var bat = load(bat_reference).instantiate()
	bat.position = marker_2d.global_position
	get_tree().current_scene.add_child(bat)
