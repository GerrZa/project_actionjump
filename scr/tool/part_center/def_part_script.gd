class_name CustomParticle
extends Sprite

var frame_count = 0
var framp_gap = 0.1

func _ready():
	
	for i in range(frame_count):
		frame = i
		
		yield(get_tree().create_timer(framp_gap),"timeout")
	
	queue_free()
