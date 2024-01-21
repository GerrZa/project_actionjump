extends ProgressBar


func _process(delta: float) -> void:
	if get_tree().current_scene.get_node_or_null("plr") != null:
		value = get_tree().current_scene.get_node("plr").hp
	
	if get_tree().current_scene.get_node("plr").hp < 0:
		get_tree().current_scene.get_node_or_null("plr").queue_free()
		queue_free()
