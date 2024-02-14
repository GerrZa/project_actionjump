extends CharacterBody2D

var chasing = false

var hp = 100

var shoot_timer
var dashed = false
var dashing = false

func _ready():
	shoot_timer = Timer.new()
	add_child(shoot_timer)
	
	$Polygon2D/AnimationPlayer.play("open")
	
	add_to_group("enemy")
	
	await $Polygon2D/AnimationPlayer.animation_finished
	
	randomize()
	shoot_timer.start(randf_range(2,5))
	
	shoot_timer.timeout.connect(shoot)
	
	chasing = true

func _physics_process(delta):
	
	if get_node_or_null("../player") != null:
		
		if chasing:
			
			if global_position.distance_to(get_node("../player").global_position) > 140:
				
				print(global_position.distance_to(get_node("../player").global_position))
				
				velocity = global_position.direction_to(get_node("../player").global_position) * 60
				
				move_and_slide()
			elif global_position.distance_to(get_node("../player").global_position) < 70:
				
				velocity = global_position.direction_to(get_node("../player").global_position) * -30
				
				move_and_slide()
	
	$Label.text = var_to_str(hp)
	
	if hp<=0:
		queue_free()

func hurt(value):
	hp-=value
	$Sprite2D/flash/AnimationPlayer.play("hit")

func got_knifed():
	$Sprite2D/flash/AnimationPlayer.play("hit")
	hp-=10
	
	var bullet = load("res://ptt/droped_bull.tscn").instantiate()
	
	randomize()
	
	var spawn_off = Vector2(randf_range(0,1),randf_range(0,1)) * 5
	
	bullet.global_position = global_position + spawn_off
	
	get_tree().current_scene.add_child(bullet)
	
	
func shoot():
	var bullet = load("res://ptt/bullet.tscn").instantiate()
	
	bullet.global_position = global_position
	bullet.dir = global_position.direction_to(get_node("../player").global_position)
	bullet.hit_plr = true
	
	get_tree().current_scene.add_child(bullet)
	
