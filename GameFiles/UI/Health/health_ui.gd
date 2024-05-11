extends Control

@onready var total : TextureRect = $Total
@onready var healthy : TextureRect = $Healthy

@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalsAutoload.player_health_changed.connect(health_changed)
	SignalsAutoload.player_died.connect(player_died)
	total.size.x = 128 * 3
	healthy.size.x = 128 * 3
	animation_player.play("flicker")


func health_changed(old, new) -> void:
	healthy.size.x = 128 * (new)
	animation_player.play("flicker")


func player_died() -> void:
	healthy.size.x = 0
