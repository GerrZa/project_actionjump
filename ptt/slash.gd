extends Polygon2D

var dir = Vector2.ZERO

var live_time = 2.35
var a_ch = 1

func _physics_process(delta):
	global_position += dir * 3
	look_at(global_position+dir)
	live_time -= delta
	
	color = Color(1,1,1,a_ch)
	
	if a_ch > 0:
		a_ch = live_time/2.35
	else:
		queue_free()
	
	
