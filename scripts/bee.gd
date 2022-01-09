extends Node2D

func _ready():
	pass

func _process(delta):
	var x = (get_global_mouse_position().x - get_position().x) * 0.2
	var y = (get_global_mouse_position().y - get_position().y) * 0.2

	translate(Vector2(x, y))
	pass
