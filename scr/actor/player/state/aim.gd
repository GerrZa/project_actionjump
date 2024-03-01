extends PlayerState


func physics_update(delta):
	plr.motion = plr.motion.move_toward(plr.p_input * plr.aim_walk_speed,plr.aim_acc)
	
	plr.motion = plr.move_and_slide(plr.motion)

func update(delta):
	
	owner.animtree.set("parameters/run/blend_position",owner.global_position.direction_to(owner.get_global_mouse_position()))
