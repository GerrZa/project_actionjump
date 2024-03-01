# GUN SHOOT
extends State

func start(msg:={}):
	if owner.curr_bullet[0] == "e":
		ParticleCenter.spawn_part("empty_shoot_test",owner.shoot_pos,Vector2(15,0),true,true,owner.shoot_pos + owner.global_position.direction_to(owner.get_global_mouse_position()))
		print("emp")
		fsm.transition("after_shoot_cd",{"cd":owner.empty_af_cd})
	else:
		BulletCenter.shoot_bullet(owner.curr_bullet[0],owner.shoot_pos,owner.get_node("gun_anchor").global_position.direction_to(owner.get_global_mouse_position()))
		fsm.transition("after_shoot_cd",{"cd":owner.def_af_cd})

func update(delta):
	owner.get_node("gun_anchor").look_at(owner.get_global_mouse_position())
	
	if Input.is_action_just_pressed("ui_reload"):
		fsm.transition("load")

