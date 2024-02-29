class_name Player
extends KinematicBody2D

var last_dir = Vector2.DOWN
var p_input = Vector2.ZERO

var motion := Vector2.ZERO
var speed = 130
var dash_speed = 450

var friction = 30
var acc = 20

var curr_bullet := ["e","e","e","e","e","e"]
var hold_bullet := []

signal bullet_full

onready var animtree = $FreeCharacter0/AnimationTree

var gun_stack_scn = preload("res://scr/obj/player_gun/gun_stack.tscn")
var base_gun = null

onready var shoot_pos = $gun_anchor/shoot_pos.global_position

func _ready():
	
	yield(get_tree().current_scene,"ready")
	
	$gun_anchor.set_as_toplevel(true)
	$gun_anchor.global_position = global_position - Vector2(0,4)
	
	base_gun = gun_stack_scn.instance()
	var vp = Viewport.new()
	
	vp.size = Vector2(18,24)
	vp.render_target_v_flip = true
	vp.transparent_bg = true
	
	get_tree().current_scene.add_child(vp)
	
	$gun.texture = vp.get_texture()
	
	vp.add_child(base_gun)
	

func _process(delta):
	p_input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	p_input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	p_input = p_input.normalized()
	
	if p_input != Vector2.ZERO:
		last_dir = p_input
	
	animtree.set("parameters/run/blend_position",last_dir)
	
	if global_position.direction_to(get_global_mouse_position()).y < 0:
		$gun.z_index = -1
	elif global_position.direction_to(get_global_mouse_position()).y > 0:
		$gun.z_index = 1
		
	
	$curr_state/Label.text = $fsm.state.name
	
	shoot_pos = $gun_anchor/shoot_pos.global_position
	
	base_gun.look_at_vec = $gun_anchor.global_position.direction_to(get_global_mouse_position()) + Vector2(9,14)
	$gun.global_position = $gun_anchor/gun_pos_mark.global_position
	
	$gun_anchor.global_position += $gun_anchor.global_position.direction_to(global_position - Vector2(0,4)) * $gun_anchor.global_position.distance_to(global_position - Vector2(0,4)) * 0.175
	
