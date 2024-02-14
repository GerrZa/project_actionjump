extends CharacterBody2D

var p_input = Vector2.ZERO
var curr_bullet = ["  ","  ","  ","  ","  ","  ",]
var hold_bullet = ["  ","  ","  ","  ","  ","  ",]

var hp = 250 

func _process(delta: float) -> void:
	
#	print(hold_bullet)
	
	$Marker2D.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("m1"):
		for i in $Marker2D/knife_area.get_overlapping_bodies():
			i.hurt(30)
	
	if Input.is_action_just_pressed("space"):
		randomize()
		hold_bullet.shuffle()
		curr_bullet = hold_bullet
		hold_bullet = []
	
	if Input.is_action_just_pressed("m1"):
		match curr_bullet[0]:
			"  ":
				print("pheffff")
			"x":
				var bullet = load("res://ptt/bullet.tscn").instantiate()
				
				bullet.global_position = global_position
				bullet
				
				get_tree().current_scene.add_child(bullet)
				


func _physics_process(delta: float) -> void:
	p_input.x = Input.get_axis("left","right")
	p_input.y = Input.get_axis("up","down")
	
	velocity = velocity.move_toward(p_input.normalized() * 170,55)
	
	if Input.is_action_just_pressed("shift"):
		velocity = p_input.normalized() * 700
	
	move_and_slide()


func hurt(value):
	
	hp-=value
	
