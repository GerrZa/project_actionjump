extends PlayerState


func physics_update(delta):
	plr.motion = plr.motion.move_toward(plr.p_input * plr.aim_walk_speed,plr.aim_acc)
	
	plr.motion = plr.move_and_slide(plr.motion)
	
