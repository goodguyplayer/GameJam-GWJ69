extends Node2D

@onready var pin_joint_2d : PinJoint2D = $PinJoint2D


func _ready():
	SignalsAutoload.player_died.connect(_on_player_player_died)


func _on_player_player_died():
	pin_joint_2d.queue_free()
	pass
