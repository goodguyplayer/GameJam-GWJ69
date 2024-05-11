class_name HealthComponent
extends Node

signal health_changed(old_health, new_health)
signal died()

@export var max_health : int = 3
@export var current_health : int = 3

func take_damage() -> void:
	var old_health : int = current_health
	current_health -= 1
	health_changed.emit(old_health, current_health)
	if current_health <= 0:
		died.emit()
