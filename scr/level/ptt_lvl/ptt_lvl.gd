extends Node2D


func _process(delta):
	$Viewport/gun.ro_deg = rad2deg($Icon.global_position.angle_to_point(get_global_mouse_position())) - 180
