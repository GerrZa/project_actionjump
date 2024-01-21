extends CharacterBody2D

var spd = 65

var hp = 70

func _physics_process(delta):
	velocity = global_position.direction_to(get_tree().current_scene.get_node("plr").global_position)
	velocity = velocity * spd
	
	move_and_slide()
	

func hurt(value):
	
	hp -= value
	if hp <= 0:
		queue_free()

func kb(dir):
	global_position + dir * 1.5


func _on_timer_timeout():
	
	var bullet_ins = load("res://ptt/bullet.tscn").instantiate()
	
	bullet_ins.target_plr = true
	
	bullet_ins.velo = global_position.direction_to(get_node("../plr").global_position)
	get_tree().current_scene.add_child(bullet_ins)
	
	bullet_ins.global_position = global_position
	
	$Timer.start(2.45)
	
