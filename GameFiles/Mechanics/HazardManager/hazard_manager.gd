extends Node2D

@export var bat_spawner_array : Array[BatSpawner]
@export var void_hole_array : Array[VoidHoleSpawner]
@export var collectable_array : Array[CollectableItemSpawner]
@export var time_delay_min : float = 3.0
@export var time_delay_max : float = 4.0
@export var increment : float = 0.5
@export var bats_per_spawn : int = 3
@export var voids_per_spawn : int = 2
@export var items_per_spawn : int = 1

@onready var timer : Timer = $Timer
@onready var void_timer : Timer = $VoidTimer
@onready var collectable_timer = $CollectableTimer



func _ready():
	timer.start(RandomizerAutoload.rng.randf_range(time_delay_min, time_delay_max))
	void_timer.start(RandomizerAutoload.rng.randf_range(time_delay_min, time_delay_max))
	collectable_timer.start(RandomizerAutoload.rng.randf_range(time_delay_min, time_delay_max))


func _spawn_bats() -> void:
	var unique_spawners = []
	var to_spawn = bats_per_spawn
	var bat_spawner : BatSpawner
	while to_spawn > 0:
		
		bat_spawner = bat_spawner_array[RandomizerAutoload.rng.randi_range(0, len(bat_spawner_array) - 1)]
		if bat_spawner not in unique_spawners:
			bat_spawner.start_spawning_bat()
			unique_spawners.append(bat_spawner)
			to_spawn -= 1
	timer.start(RandomizerAutoload.rng.randf_range(time_delay_min, time_delay_max))
	

func _spawn_void_holes() -> void:
	var unique_spawners = []
	var to_spawn = voids_per_spawn
	var void_spawner : VoidHoleSpawner
	while to_spawn > 0:
		
		void_spawner = void_hole_array[RandomizerAutoload.rng.randi_range(0, len(void_hole_array) - 1)]
		if void_spawner not in unique_spawners:
			void_spawner.start_spawning_void()
			unique_spawners.append(void_spawner)
			to_spawn -= 1
	void_timer.start(RandomizerAutoload.rng.randf_range(time_delay_min, time_delay_max))
	

func _spawn_collectable_items() -> void:
	var unique_spawners = []
	var to_spawn = items_per_spawn
	var collectable_spawner : CollectableItemSpawner
	while to_spawn > 0:
		
		collectable_spawner = collectable_array[RandomizerAutoload.rng.randi_range(0, len(collectable_array) - 1)]
		if collectable_spawner not in unique_spawners:
			collectable_spawner.spawn_colletable()
			unique_spawners.append(collectable_spawner)
			to_spawn -= 1
	collectable_timer.start(RandomizerAutoload.rng.randf_range(time_delay_min, time_delay_max))
		

func _on_timer_timeout():
	_spawn_bats()


func _on_void_timer_timeout():
	_spawn_void_holes()


func _on_collectable_timer_timeout():
	_spawn_collectable_items()
