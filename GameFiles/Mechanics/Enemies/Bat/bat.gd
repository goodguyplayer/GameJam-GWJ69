extends CharacterBody2D


@export var movement_speed = -10000


var flag_show_up : bool = false


func _physics_process(delta):

	velocity.y = movement_speed * delta

	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_entered():
	flag_show_up = true
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	if flag_show_up:
		queue_free()
