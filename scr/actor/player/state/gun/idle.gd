# GUN IDLE
extends State


func update(delta):
	owner.get_node("gun_anchor").look_at(owner.get_global_mouse_position())
	
	if Input.is_action_just_pressed("ui_m1") and owner.curr_bullet.size() > 0:
		if owner.reloading == false:
			fsm.transition("shoot")
	
	if Input.get_action_strength("ui_m2") == 0:
		fsm.transition("put_off")
	
	owner.get_node("Camera2D").global_position = owner.get_node("gun_anchor/gun_cam").global_position
