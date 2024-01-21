extends CharacterBody2D

var hp = 50

var spd = 70

func _physics_process(delta):
	velocity.x = lerp(velocity.x, global_position.direction_to(get_tree().current_scene.get_node("plr").global_position).x * spd, 0.4)
	velocity.y = lerp(velocity.y, global_position.direction_to(get_tree().current_scene.get_node("plr").global_position).y * spd, 0.4)
	
	move_and_slide()
	

func hurt(value):
	
	hp -= value
	if hp <= 0:
		queue_free()

func kb(dir):
	global_position + dir * 1.5

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.hurt(20)


func _on_timer_timeout() -> void:
	print("dash")
	velocity = global_position.direction_to(get_node("../plr").global_position) * spd * 30
	#global_position += global_position.direction_to(get_node("../plr").global_position) * spd * 1.005
	$Timer.start(1.2)
