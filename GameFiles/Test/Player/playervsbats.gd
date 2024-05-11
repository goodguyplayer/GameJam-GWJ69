extends Node2D

@onready var bat_spawner = $BatSpawner
@onready var bat_spawner_2 = $BatSpawner2
@onready var bat_spawner_3 = $BatSpawner3
@onready var bat_spawner_4 = $BatSpawner4
@onready var bat_spawner_5 = $BatSpawner5
@onready var bat_spawner_6 = $BatSpawner6
@onready var bat_spawner_7 = $BatSpawner7

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	bat_spawner.start_spawning_bat()
	bat_spawner_2.start_spawning_bat()
	bat_spawner_3.start_spawning_bat()
	bat_spawner_4.start_spawning_bat()
	bat_spawner_5.start_spawning_bat()
	bat_spawner_6.start_spawning_bat()
	bat_spawner_7.start_spawning_bat()
