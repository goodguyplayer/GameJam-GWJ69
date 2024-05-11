extends Control

@onready var total : TextureRect = $Total
@onready var healthy : TextureRect = $Healthy

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalsAutoload.player_health_changed.connect(health_changed)
	total.size.x = 128 * 3
	healthy.size.x = 128 * 3


func health_changed(old, new) -> void:
	healthy.size.x = 128 * (new)
