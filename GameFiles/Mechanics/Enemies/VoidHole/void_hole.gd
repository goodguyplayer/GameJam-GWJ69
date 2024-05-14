class_name VoidHole
extends Area2D

@export var player_body : Player
@export var gravity_pull : float = 9.8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if player_body != null:
		player_body.apply_force((self.global_position - player_body.global_position).normalized() * gravity_pull)


func _spawn() -> void:
	pass
	

func _despawn() -> void:
	pass


func _on_body_entered(body):
	if body is Player:
		player_body = body
		
		

func _on_body_exited(body):
	if body is Player:
		player_body = null
