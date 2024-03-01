#PUT ON
extends State



func start(msg:={}):
	owner.get_node("fsm").transition("aim")
	
	var tween := create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.tween_property(owner.get_node("gun_anchor/gun"),"position",owner.get_node("gun_anchor/gun_pos_mark").position,owner.pull_on_time)
	tween.parallel().tween_property(owner.get_node("gun_anchor/gun"),"modulate",Color(1,1,1,1),owner.pull_on_time)
	
	yield(tween,"finished")
	
	fsm.transition("idle")

func update(delta):
	owner.get_node("gun_anchor").look_at(owner.get_global_mouse_position())
