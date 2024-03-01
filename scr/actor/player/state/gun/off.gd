extends State


func update(delta):
	if Input.get_action_strength("ui_m2") > 0:
		fsm.transition("put_on")
	owner.get_node("gun_anchor/gun").modulate = Color(1,1,1,0)
	
	owner.get_node("gun_anchor").look_at(owner.get_global_mouse_position())
