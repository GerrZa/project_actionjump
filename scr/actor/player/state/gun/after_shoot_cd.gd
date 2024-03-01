extends State

func start(msg:={}):
	if msg.has("cd"):
		
		owner.curr_bullet.remove(0)
		
		yield(get_tree().create_timer(msg["cd"]),"timeout")
		
		fsm.transition("idle")
		

func update(delta):
	owner.get_node("gun_anchor").look_at(owner.get_global_mouse_position())
