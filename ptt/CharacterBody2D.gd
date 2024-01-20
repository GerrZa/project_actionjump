extends CharacterBody2D

var p_in = Vector2.ZERO
var spd = 135

var maxhp = 100
var hp = 100

var first_wp = null
var sec_wp = null

func _process(delta: float) -> void:
	p_in.x = Input.get_axis("left","right")
	p_in.y = Input.get_axis("up","down")
	
	p_in = p_in.normalized()
	
	$gui.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("m1"):
		match first_wp:
			null:
				print("no weapon")
			"gun":
				shoot()
			"shield":
				parry()
			"knife":
				knife()
	
	

func _physics_process(delta: float) -> void:
	
	velocity = p_in * spd
	
	move_and_slide()
	
	pass

func parry():
	pass

func shoot():
	pass

func knife():
	pass

func grenade():
	pass
