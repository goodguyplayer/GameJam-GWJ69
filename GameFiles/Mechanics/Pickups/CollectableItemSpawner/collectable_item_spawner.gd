class_name CollectableItemSpawner
extends Node2D

@export_enum("SCORE_INCREASE", "SCORE_BOOST") var spawner

@onready var marker_2d : Marker2D = $Marker2D

var path_array : Array = [
	"res://Mechanics/Pickups/CollectableItem/score_increase_item.tscn"
] 


func spawn_colletable() -> void:
	print("SPAWNING")
	var to_spawn : CollectableItem = load(path_array[spawner]).instantiate()
	to_spawn.direction = (marker_2d.global_position - self.global_position).normalized()
	to_spawn.position = marker_2d.global_position
	get_tree().current_scene.add_child(to_spawn)
