class_name Player
extends CharacterBody2D

var p_input = 0
var spd = 130
var grav = 20

func _process(delta: float) -> void:
	p_input = Input.get_axis("pl","pr")
	
