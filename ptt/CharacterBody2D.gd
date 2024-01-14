extends CharacterBody2D

enum {
	IDLE,
	RUN,
	AIR,
}

var state = IDLE

var grav = 45
var p_in = 0

func _physics_process(delta):
	#print(p_in)
	
	match state:
		IDLE:
			velocity.x = 0
			velocity.y += grav
			velocity.y = clamp(velocity.y,-10000,350)
			
			move_and_slide()
			print("idle")
		RUN:
			velocity.x = p_in * 225
			velocity.y += grav
			velocity.y = clamp(velocity.y,-10000,350)
			
			move_and_slide()
			print("run")
		AIR:
			velocity.x += p_in * 70
			velocity.x = clamp(velocity.x,-225,225)
			velocity.y += grav
			velocity.y = clamp(velocity.y,-10000,350)
			
			move_and_slide()
			print("air")
			

func _process(delta):
	p_in = Input.get_axis("pl","pr")
	match state:
		IDLE:
			if p_in != 0:
				c_state(RUN)
			if is_on_floor() and Input.is_action_just_pressed("pj"):
				c_state(AIR,["jump"])
			if !is_on_floor():
				c_state(AIR)
		RUN:
			if p_in == 0:
				c_state(IDLE)
			if is_on_floor() and Input.is_action_just_pressed("pj"):
				c_state(AIR,["jump"])
			if !is_on_floor():
				c_state(AIR)
		AIR:
			if is_on_floor():
				if p_in != 0:
					c_state(RUN)
				elif p_in == 0:
					c_state(IDLE)

func c_state(st,addi_func:=[]):
	state = st
	for i in addi_func:
		call(i)
	pass

func jump():
	velocity.y = -650

func kickup():
	if $obj_inter.get_overlapping_areas().size() != 0:
		for i  in $obj_inter.get_overlapping_areas():
			i.up()
