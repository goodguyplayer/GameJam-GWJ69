extends CharacterBody2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var label : Label = $Label


const SPEED = 200.0
var direction : Vector2
var nice_names : Array[String] = [
	"NICE",
	"6NICE",
	"HEHE FUNNI NUMBER",
	"NIIICE",
	"NICE",
	"NICE9"
]


func _ready():
	var direction_y = RandomizerAutoload.rng.randf_range(-1.0, 1.0)
	direction = Vector2(-1, direction_y)
	#rotation = direction_y
	animation_player.play("spawn")
	label.text = nice_names[RandomizerAutoload.rng.randi_range(0, len(nice_names) - 1)]


func _physics_process(delta):
	velocity = direction * SPEED
	move_and_slide()


func _change_animation() -> void:
	animation_player.play("despawn")


func _despawn() -> void:
	queue_free()
