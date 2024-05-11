extends RigidBody2D


@export var push_force = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	var input_direction = Input.get_axis("input_left", "input_right")
	var force_to_push = Vector2(input_direction * push_force, 0)
	apply_force(force_to_push)
	
