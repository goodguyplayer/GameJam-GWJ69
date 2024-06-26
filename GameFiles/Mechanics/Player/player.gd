class_name Player
extends RigidBody2D


@export var push_force = 1000
@export var dash_force = 50
@export var dash_delay : float = 3.0

@onready var dash_timer : Timer = $DashTimer
@onready var animation_player : AnimationPlayer = $AnimationPlayer


signal player_died()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	var input_direction = Input.get_axis("input_left", "input_right")
	var force_to_push = Vector2(input_direction * push_force, 0)
	
	if dash_timer.is_stopped():
		if Input.is_action_pressed("input_dash"):
			force_to_push *= dash_force
			dash_timer.start(dash_delay)
			SignalsAutoload.dash_used.emit()
			
	apply_force(force_to_push)





func _on_dash_timer_timeout():
	SignalsAutoload.dash_available.emit()


func _on_health_component_health_changed(old_health, new_health):
	SignalsAutoload.player_health_changed.emit(old_health, new_health)
	animation_player.play("flicker")


func _on_health_component_died():
	animation_player.play("die")
	SignalsAutoload.player_died.emit()
