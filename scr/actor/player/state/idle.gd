extends PlayerState


func physics_update(delta):
	plr.velocity = plr.velocity.move_toward(Vector2.ZERO,plr.friction)
	
	plr.move_and_slide()

func update(delta):
	if plr.p_input != Vector2.ZERO:
		fsm.transition("run")
	
