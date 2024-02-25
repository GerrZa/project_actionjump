tool
extends Node2D

export var ro_deg = 0



func _physics_process(delta):
	for i in get_children():
		i.rotation_degrees = ro_deg
