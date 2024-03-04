class_name Player
extends KinematicBody2D

var last_dir = Vector2.DOWN
var p_input = Vector2.ZERO

var motion := Vector2.ZERO
var speed = 130
var dash_speed = 450

var pull_back_time = 0.3
var fade_out_time = 0.1

var pull_on_time = 0.25

var aim_walk_speed = 30
var aim_acc = 10

var friction = 30
var acc = 20


var curr_bullet := ["e","e","e","e","e","e"]
var hold_bullet := []

# after shoot cooldown
var empty_af_cd = 0.35
var def_af_cd = 0.55

signal bullet_full

onready var reload_tm = $reload_timer
var reload_time = 1.5
var reload_time_left = 0

var reloading = false

onready var shoot_tm = $shoot_cd
var temp_base_shoot_cd = 1

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
	
	$gun_anchor/gun.texture = vp.get_texture()
	
	vp.add_child(base_gun)
	

func _physics_process(delta):
#	print("anchor : " + String($gun_anchor.rotation_degrees))
#	print("gun : " + String($gun_anchor/gun.rotation_degrees))
#	print(Engine.get_frames_per_second())
	pass

func _process(delta):
	p_input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	p_input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	p_input = p_input.normalized()
	
	if p_input != Vector2.ZERO:
		last_dir = p_input
	
	
	if global_position.direction_to(get_global_mouse_position()).y < 0:
		$gun_anchor/gun.z_index = -1
	elif global_position.direction_to(get_global_mouse_position()).y > 0:
		$gun_anchor/gun.z_index = 1
		
	
	$gun_anchor/gun_cam.global_position = $gun_anchor.global_position + $gun_anchor.global_position.direction_to($gun_anchor/gun_pos_mark.global_position) * 50
	
	
	$curr_state/Label.text = $fsm.state.name
	$curr_state/Label2.text = $gun_fsm.state.name
	
	shoot_pos = $gun_anchor/shoot_pos.global_position
	
	base_gun.look_at_vec = $gun_anchor.global_position.direction_to(get_global_mouse_position()) + Vector2(9,14)
#	$gun.global_position = $gun_anchor/gun_pos_mark.global_position
	$gun_anchor/gun.rotation_degrees = -$gun_anchor.rotation_degrees
	
	$gun_anchor.global_position += $gun_anchor.global_position.direction_to(global_position - Vector2(0,4)) * $gun_anchor.global_position.distance_to(global_position - Vector2(0,4)) * 0.175
	
	reload_time_left = reload_tm.time_left
	$reload_bar_base.scale.x = reload_time_left / reload_time
	
	$shoot_cd_bar_base.scale.x = shoot_tm.time_left / temp_base_shoot_cd
	
	if reloading == false and Input.is_action_just_pressed("ui_reload"):
		load_bullet()

func load_bullet():
	
	reload_tm.start(reload_time)
	reloading = true
	
	#clear chamber
	curr_bullet = []
	
	#Replace with hold bullet
	curr_bullet.append_array(hold_bullet)
	
	#add emptu slot
	for i in range(6 - curr_bullet.size()):
		curr_bullet.append("e")
	
	#clear hold bullet
	hold_bullet = []
	
	randomize()
	
	#shuffle it
	curr_bullet.shuffle()
	
	#RELOAD ANIM / FX
	
	yield(reload_tm,"timeout")
	
	reloading = false
	# AFTER LOAD FX
	
