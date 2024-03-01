#DODGE
extends PlayerState


var dash_dir = Vector2.ZERO
var local_dash_speed = 0

func start(msg:={}):
	dash_dir = plr.last_dir
	local_dash_speed = plr.dash_speed

func physics_update(delta):
	
	plr.motion = dash_dir * local_dash_speed
	local_dash_speed = move_toward(local_dash_speed,0,plr.friction)
	
	plr.motion = plr.move_and_slide(plr.motion)
	

func update(delta):
	if local_dash_speed < plr.speed:
		if plr.p_input != Vector2.ZERO:
			fsm.transition("run")
		elif plr.p_input == Vector2.ZERO:
			fsm.transition("idle")
	owner.animtree.set("parameters/run/blend_position",owner.last_dir)
