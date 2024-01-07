extends PlayerState

func enter(msg:={}):
	if msg.has("jump"):
		plr.velocity.y = -plr.jump_f
	elif msg.has("upkick"):
		plr.upkick_avai = false
		plr.velocity.y = -plr.upkick_f

func physics_update(delta):
	plr.velocity.y += plr.grav
	plr.velocity.x += plr.p_input * plr.acc * plr.spd * 0.6
	plr.velocity.x = clamp(plr.velocity.x,-plr.spd,plr.spd)
	
	plr.move_and_slide()

func update(delta):
	if plr.is_on_floor():
		if plr.p_input == 0:
			fsm.transition("idle")
		else:
			fsm.transition("run")
	
	if Input.is_action_just_pressed("pj") and plr.upkick_avai:
		fsm.transition("air",{"upkick":true})
