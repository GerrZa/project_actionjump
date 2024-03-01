extends PlayerState


func physics_update(delta):
	plr.motion = plr.motion.move_toward(plr.p_input * plr.speed,plr.acc)
	
	plr.motion = plr.move_and_slide(plr.motion)

func update(delta):
	if plr.p_input == Vector2.ZERO:
		fsm.transition("idle")
	
	if Input.is_action_just_pressed("ui_shift"):
		fsm.transition("dash")
	owner.animtree.set("parameters/run/blend_position",owner.last_dir)
