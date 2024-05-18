class_name CollectableItem
extends CharacterBody2D


@export var movement_speed = 10000
@export var direction : Vector2

@onready var sprite_2d : Sprite2D  = $Sprite2D
@onready var score_increase_node : ScoreIncrease = $ScoreIncrease

var flag_show_up : bool = false


func _ready():
	assert(sprite_2d)
	assert(score_increase_node)
	if score_increase_node.how_much > 60:
		sprite_2d.frame = 2
	elif score_increase_node.how_much > 40:
		sprite_2d.frame = 1
	else:
		sprite_2d.frame = 0


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


func _on_score_increase_new_score(score):
	if score > 60:
		sprite_2d.frame = 2
	elif score > 40:
		sprite_2d.frame = 1
	else:
		sprite_2d.frame = 0
