extends Control

@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	play_animation()
	SignalsAutoload.dash_available.connect(play_animation)
	SignalsAutoload.dash_used.connect(dash_used)


func play_animation() -> void:
	animation_player.play("dash_available")


func dash_used() -> void:
	animation_player.play("dash_used")
