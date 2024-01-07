#IDLE
extends PlayerState

func enter(msg:={}):
	plr.upkick_avai = true

func physics_update(delta):
	plr.velocity.x = move_toward(plr.velocity.x,0,plr.spd * plr.acc)
	plr.velocity.y += plr.grav
	
	plr.move_and_slide()

func update(delta):
	if Input.is_action_just_pressed("pj"):
		fsm.transition("air",{"jump":true})
	
	if plr.p_input != 0:
		fsm.transition("run")
	
	if plr.is_on_floor() == false:
		fsm.transition("air")
