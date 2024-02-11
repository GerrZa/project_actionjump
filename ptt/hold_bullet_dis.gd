extends Label

func _process(delta: float) -> void:
	
	var vir_bullet_list
	vir_bullet_list = %player.hold_bullet
	
	for i in range(6 - vir_bullet_list.size()):
		vir_bullet_list.append("  ")
	
	text = "%s, %s, %s, %s, %s, %s" % vir_bullet_list
