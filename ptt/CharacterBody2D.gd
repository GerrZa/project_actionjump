extends CharacterBody2D

var p_input = Vector2.ZERO
var curr_bullet = ["  ","  ","  ","  ","  ","  "]
var hold_bullet = ["  ","  ","  ","  ","  ","  "]

var hp = 150

func _process(delta: float) -> void:
	
#	print(hold_bullet)
	
	$Marker2D.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("m2"):
		for i in $Marker2D/knife_area.get_overlapping_bodies():
			i.got_knifed()
	
	if Input.is_action_just_pressed("space"):
		randomize()
		hold_bullet.shuffle()
		curr_bullet = hold_bullet
		hold_bullet = []
	
	if Input.is_action_just_pressed("m1"):
		match curr_bullet[0]:
			"  ":
				print("pheffff")
				
				curr_bullet.pop_front()
				curr_bullet.append("  ")
			"o":
				var bullet = load("res://ptt/bullet.tscn").instantiate()
				
				bullet.global_position = global_position
				bullet.dir = global_position.direction_to(get_global_mouse_position())
				
				get_tree().current_scene.add_child(bullet)
				
				curr_bullet.pop_front()
				curr_bullet.append("  ")
			"x":
				var init_vector = global_position.direction_to(get_global_mouse_position())
				init_vector = init_vector.rotated(deg_to_rad(-10))
				
				for i in range(3):
					
					var bullet = load("res://ptt/bullet.tscn").instantiate()
					
					bullet.global_position = global_position
					bullet.dir = init_vector.rotated(deg_to_rad((i)*10))
					
					get_tree().current_scene.add_child(bullet)
				
				curr_bullet.pop_front()
				curr_bullet.append("  ")
				
	
	$Label.text = var_to_str(hp)
	if hp<=0:
		queue_free()


func _physics_process(delta: float) -> void:
	p_input.x = Input.get_axis("left","right")
	p_input.y = Input.get_axis("up","down")
	
	velocity = velocity.move_toward(p_input.normalized() * 170,55)
	
	if Input.is_action_just_pressed("shift"):
		velocity = p_input.normalized() * 700
	
	move_and_slide()


func hurt(value):
	
	hp-=value
	
