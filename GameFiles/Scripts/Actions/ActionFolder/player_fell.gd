class_name PlayerFell
extends Action


func execute() -> void:
	SignalsAutoload.player_fell.emit()
