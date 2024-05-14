class_name VoidHoleSpawner
extends Node2D


@export var void_reference : = "res://Mechanics/Enemies/VoidHole/void_hole.tscn"

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var marker_2d : Marker2D = $Marker2D



func start_spawning_void():
	animation_player.play("spawn_void")


func spawn_void():
	var void_ = load(void_reference).instantiate()
	void_.position = marker_2d.global_position
	get_tree().current_scene.add_child(void_)
