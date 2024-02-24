class_name Player
extends CharacterBody2D

var p_input = Vector2.ZERO
var speed = 215
var friction = 35
var acc = 40

var last_dir = Vector2.DOWN

@onready var animtree = $Player/AnimationTree.get("parameters/playback")
@onready var idle_blend = $Player/AnimationTree.get("parameters/idle/blend_position")
@onready var run_blend = $Player/AnimationTree.get("parameters/run/blend_position")


func _process(delta: float) -> void:
	
	p_input.x = Input.get_axis("left","right")
	p_input.y = Input.get_axis("up","down")
	
	p_input = p_input.normalized()
	
	if p_input != Vector2.ZERO:
		last_dir = p_input
	
	idle_blend = last_dir
	run_blend = last_dir
	
	print(idle_blend)
