extends State

func start(msg:={}):
	if msg.has("cd"):
		
		owner.curr_bullet.remove(0)
		owner.temp_base_shoot_cd = msg["cd"]
		
		owner.shoot_tm.start(msg["cd"])
		yield(owner.shoot_tm,"timeout")
		
		fsm.transition("idle")
		

func update(delta):
	owner.get_node("gun_anchor").look_at(owner.get_global_mouse_position())
#	owner.get_node("gun").global_position = owner.get_node("gun_anchor/gun_pos_mark").global_position
	
	owner.get_node("Camera2D").global_position = owner.get_node("gun_anchor/gun_cam").global_position
