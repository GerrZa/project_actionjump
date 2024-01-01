#RUN
extends PlayerState


func physics_update(delta):
	plr.velocity.x = plr.p_input * plr.spd
	plr.velocity.y += plr.grav
	
	plr.move_and_slide()

func update(delta):
	if plr.p_input == 0:
		fsm.transition("idle")
