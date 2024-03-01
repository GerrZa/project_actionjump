extends State


func start(msg:={}):
	#clear chamber
	owner.curr_bullet = []
	
	#Replace with hold bullet
	owner.curr_bullet.append_array(owner.hold_bullet)
	
	#add emptu slot
	for i in range(6 - owner.curr_bullet.size()):
		owner.curr_bullet.append("e")
	
	#clear hold bullet
	owner.hold_bullet = []
	
	randomize()
	
	#shuffle it
	owner.curr_bullet.shuffle()
	
	#RELOAD ANIM / FX
	
	yield(get_tree().create_timer(owner.reload_time),"timeout")
	
	# AFTER LOAD FX
	
	fsm.transition("idle")
	

func update(delta):
	
	owner.get_node("gun_anchor").look_at(owner.get_global_mouse_position())
