# GUN SHOOT
extends State

func start(msg:={}):
	BulletCenter.shoot_bullet("reg",owner.shoot_pos,owner.get_node("gun_anchor").global_position.direction_to(owner.get_global_mouse_position()))
	fsm.transition("after_shoot_cd",{"cd":0.2})

func update(delta):
	owner.get_node("gun_anchor").look_at(owner.get_global_mouse_position())

