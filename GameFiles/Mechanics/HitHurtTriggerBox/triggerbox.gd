extends Area2D


@export var action : Action

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if action:
		action.execute()


func _on_body_entered(body):
	if action:
		action.execute()
