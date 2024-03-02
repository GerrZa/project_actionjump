#PUT OFF
extends State


func start(msg:={}):
	var tween := create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.tween_property(owner.get_node("gun_anchor/gun"),"position",Vector2.ZERO,owner.pull_back_time)
	tween.parallel().tween_property(owner.get_node("gun_anchor/gun"),"modulate",Color(1,1,1,0),owner.fade_out_time)
	
	yield(tween,"finished")
	
	fsm.transition("off")
	
	if owner.p_input != Vector2.ZERO:
		owner.get_node("fsm").transition("run")
	else:
		owner.get_node("fsm").transition("idle")

func update(delta):
	owner.get_node("gun_anchor").look_at(owner.get_global_mouse_position())
	
	owner.get_node("Camera2D").global_position = owner.global_position
	
