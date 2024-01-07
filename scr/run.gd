#RUN
extends PlayerState

func enter(msg:={}):
	plr.upkick_avai = true


func physics_update(delta):
	plr.velocity.x += plr.p_input * plr.acc * plr.spd
	plr.velocity.x = clamp(plr.velocity.x,-plr.spd,plr.spd)
	
	plr.velocity.y += plr.grav
	
	plr.move_and_slide()

func update(delta):
	if Input.is_action_just_pressed("pj"):
		fsm.transition("air",{"jump":true})
	
	if plr.p_input == 0:
		fsm.transition("idle")
	
	if plr.is_on_floor() == false:
		fsm.transition("air")
