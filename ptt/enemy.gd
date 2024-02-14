extends CharacterBody2D

var chasing = false

var hp = 100
func _ready():
	$Polygon2D/AnimationPlayer.play("open")
	
	await $Polygon2D/AnimationPlayer.animation_finished
	
	chasing = true

func _physics_process(delta):
	
	if chasing:
		
		if global_position.distance_to(%player.global_position) > 140:
			
			print(global_position.distance_to(%player.global_position))
			
			velocity = global_position.direction_to(%player.global_position) * 60
			
			move_and_slide()
		elif global_position.distance_to(%player.global_position) < 70:
			
			velocity = global_position.direction_to(%player.global_position) * -30
			
			move_and_slide()

func hurt(value):
	hp-=value

func got_knifed():
	hp-=10
	
	var bullet = load("res://ptt/bullet.tscn").instantiate()
	
	randomize()
	
	var spawn_off = Vector2(randf_range(0,1),randf_range(0,1))
	
	bullet = global_position + spawn_off
	
	


