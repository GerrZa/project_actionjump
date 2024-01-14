extends Area2D

var is_up = false
var velo = Vector2.ZERO

var kickable = false
var origin_pos
var kicked = false
 

func _physics_process(delta: float) -> void:
	global_position += velo
	
	if get_overlapping_bodies().size() != 0 and kicked:
		queue_free()

func up():
	origin_pos = global_position
	
	if is_up == false:
		is_up = true
		
		velo.y = -3.5
		
		await get_tree().create_timer(0.25).timeout
		kickable = true
		
		velo.y = -0.5
		
		await get_tree().create_timer(0.75).timeout
		
		if kicked == false:
			
			velo.y = 3
			
			await get_tree().create_timer(0.45).timeout
			
			
			velo = Vector2.ZERO
			global_position = origin_pos
			kickable = false
			
		is_up = false
	

func kick(dir):
	if kickable and is_up:
		
		kicked = true
		kickable = false
		
		match dir:
			"d":
				velo.y = 10
			"r":
				velo.x = 10
				velo.y = 0
			"l":
				velo.x = -10
				velo.y = 0
