# GUN IDLE
extends State



func update(delta):
	owner.get_node("gun_anchor").look_at(owner.get_global_mouse_position())
	
	if Input.is_action_just_pressed("ui_m1"):
		fsm.transition("shoot")
