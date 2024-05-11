class_name Hurtbox
extends Area2D


@export var health_component : HealthComponent


func _ready():
	assert(health_component != null)



func _on_area_entered(area):
	if area is Hitbox:
		health_component.take_damage()
