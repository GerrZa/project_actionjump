extends CharacterBody2D

var p_in = Vector2.ZERO
var spd = 135

var maxhp = 100
var hp = 100

var first_wp = "gun"
var sec_wp = null

func _process(delta: float) -> void:
	p_in.x = Input.get_axis("left","right")
	p_in.y = Input.get_axis("up","down")
	
	p_in = p_in.normalized()
	
	$gui.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("m1") and $wp1.is_stopped():
		
		print("m1 click")
		match first_wp:
			null:
				print("no weapon")
			"gun":
				shoot()
				$wp1.start(0.16)
			"shield":
				parry()
				$wp1.start(0.2)
			"knife":
				knife(global_position.direction_to(get_global_mouse_position()))
				$wp1.start(0.15)
	
	$knife_area.look_at(get_global_mouse_position())
	

func _physics_process(delta: float) -> void:
	
	velocity = p_in * spd
	
	move_and_slide()
	
	pass

func parry():
	pass

func shoot():
	var bullet_ins = load("res://ptt/bullet.tscn").instantiate()
	
	bullet_ins.velo = global_position.direction_to(get_global_mouse_position())
	get_tree().current_scene.add_child(bullet_ins)
	
	bullet_ins.global_position = global_position

func knife(knockback_dir):
	for i in $knife_area.get_overlapping_bodies():
		i.hurt(45)
		i.kb(knockback_dir)

func grenade():
	pass
