class_name Player
extends CharacterBody2D

var p_input = 0
var spd = 220
var grav = 27
var grav_clamp = 500
var jump_f = 550
var upkick_f = 270
var upkick_avai = true
var acc = 0.21

func _process(delta: float) -> void:
	p_input = Input.get_axis("pl","pr")

func _physics_process(delta: float) -> void:
	if velocity.y > grav_clamp:
		velocity.y = grav_clamp
	
	print(velocity)
	
