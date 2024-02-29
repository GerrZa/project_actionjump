tool
extends Position2D

export var rot = 0

func _process(delta):
	for i in get_children():
		i.rotation_degrees = rot
