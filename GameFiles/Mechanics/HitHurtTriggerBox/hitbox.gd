class_name Hitbox
extends Area2D


@export var attack_component : AttackComponent


func _ready():
	assert(attack_component != null)
