#IDLE
extends PlayerState


func enter(msg:={}):
	plr.velocity.x = 0

func physics_update(delta):
	plr.velocity.y += plr.grav
	plr.move_and_slide()

func update(delta):
	if plr.p_input != 0:
		fsm.transition("run")
