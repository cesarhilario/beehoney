extends Node2D


func _ready():
	pass

func _process(delta):
	position.y -= -500 * delta
	
	if position.y >= 1400:
		queue_free()
	pass
