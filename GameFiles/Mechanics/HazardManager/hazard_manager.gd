extends Node2D

@export var bat_spawner_array : Array[BatSpawner]
@export var time_delay_min : float = 3.0
@export var time_delay_max : float = 4.0
@export var increment : float = 0.5
@export var bats_per_spawn : int = 3

@onready var timer : Timer = $Timer


func _ready():
	timer.start(RandomizerAutoload.rng.randf_range(time_delay_min, time_delay_max))


func _spawn_bats() -> void:
	var unique_spawners = []
	var to_spawn = bats_per_spawn
	var bat_spawner : BatSpawner
	while to_spawn > 0:
		
		bat_spawner = bat_spawner_array[RandomizerAutoload.rng.randi_range(0, len(bat_spawner_array) - 1)]
		if bat_spawner not in unique_spawners:
			bat_spawner.spawn_bat()
			unique_spawners.append(bat_spawner)
			to_spawn -= 1
	timer.start(RandomizerAutoload.rng.randf_range(time_delay_min, time_delay_max))
		

func _on_timer_timeout():
	_spawn_bats()
