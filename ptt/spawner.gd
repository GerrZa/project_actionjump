extends Node

var pos1 = Vector2(17,17)
var pos2 = Vector2(580,390)

var timer = null

func _ready() -> void:
	var new_timer = Timer.new()
	add_child(new_timer)
	
	timer = new_timer
	
	new_timer.timeout.connect(on_timer_stopped)
	
	spawn()
	
	new_timer.one_shot = true
	new_timer.start(3)
	

func on_timer_stopped():
	timer.start(6)
	
	if get_tree().get_nodes_in_group("enemy").size() < 2:
		spawn()

func spawn():
	randomize()
	
	var enemy_amount = randi_range(2,4)
	
	print(enemy_amount)
	
	for i in enemy_amount:
		var new_enemy = load("res://ptt/enemy.tscn").instantiate()
		randomize()
		
		new_enemy.global_position = Vector2(randf_range(pos1.x,pos2.x),randf_range(pos1.y,pos2.y))
		
		get_tree().current_scene.add_child(new_enemy)
