class_name Player
extends CharacterBody2D

var p_input = Vector2.ZERO
var speed = 215
var friction = 35
var acc = 40

func _process(delta: float) -> void:
	p_input.x = Input.get_axis("left","right")
	p_input.y = Input.get_axis("up","down")
	
	p_input = p_input.normalized()
	
