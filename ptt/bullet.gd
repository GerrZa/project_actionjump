extends Area2D

var velo = Vector2.ZERO
var spd = 270

var stack_delta = 0

@export var target_plr = false

func _physics_process(delta):
	global_position += velo * spd * delta

func _process(delta):
	if get_overlapping_bodies().size() > 0:
		get_overlapping_bodies()[0].hurt(35)
		queue_free()
		
	
	if $wall.get_overlapping_bodies().size() > 0:
		queue_free()
	
	look_at(global_position+velo)
	
	stack_delta += delta
	if stack_delta > 20:
		queue_free()
	
	match target_plr:
		true:
			set_collision_mask_value(2,false)
			set_collision_mask_value(1,true)
		false:
			set_collision_mask_value(2,true)
			set_collision_mask_value(1,false)
