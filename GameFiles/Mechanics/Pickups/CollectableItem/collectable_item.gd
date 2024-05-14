class_name CollectableItem
extends CharacterBody2D


@export var movement_speed = 1000
@export var direction : Vector2


var flag_show_up : bool = false


func _physics_process(delta):
	if direction:
		velocity = direction * movement_speed * delta
	else:
		velocity.x = movement_speed * delta

	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_entered():
	flag_show_up = true
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	if flag_show_up:
		queue_free()


func _on_triggerbox_body_entered(body):
	queue_free()
