class_name Player
extends KinematicBody2D

var last_dir = Vector2.DOWN
var p_input = Vector2.ZERO

var motion := Vector2.ZERO
var speed = 130
var dash_speed = 450

var friction = 30
var acc = 20

onready var animtree = $FreeCharacter0/AnimationTree



func _process(delta):
	p_input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	p_input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	p_input = p_input.normalized()
	
	if p_input != Vector2.ZERO:
		last_dir = p_input
	
	animtree.set("parameters/run/blend_position",last_dir)
	
	if Input.is_action_just_pressed("ui_m1"):
		BulletCenter.shoot_bullet("reg",global_position,global_position.direction_to(get_global_mouse_position()))
	
	$curr_state/Label.text = $fsm.state.name
