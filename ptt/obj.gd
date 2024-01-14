extends Area2D

var is_up = false

func up():
	if is_up == false:
		is_up = true
		
		
		
		await get_tree().create_timer(0.2).timeout
	
	
	pass
