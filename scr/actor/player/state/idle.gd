#IDLE
extends PlayerState


func physics_update(delta):
	plr.motion = plr.motion.move_toward(Vector2.ZERO,plr.friction)
	
	plr.motion = plr.move_and_slide(plr.motion)

func update(detla):
	if plr.p_input != Vector2.ZERO:
		fsm.transition("run")
