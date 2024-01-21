extends Label


func _process(delta: float) -> void:
	if get_node_or_null("../../plr") != null:
		text = var_to_str(get_node("../../plr").money) + "$"
	else: print('null')
