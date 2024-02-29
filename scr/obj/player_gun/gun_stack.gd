extends Node2D

var spr = preload("res://asset/obj/gun_stack_test.png")

var look_at_vec = Vector2.ZERO

func _ready():
	for i in $Position2D.get_children():
		i.queue_free()
	
	for i in range(7):
		
		var gun = Sprite.new()
		gun.hframes = 7
		gun.frame = i
		
		gun.texture = spr
		
		gun.position = -Vector2(0,i)
		
		$Position2D.add_child(gun)
		

func _process(delta):
	$look_at_base.look_at(look_at_vec)
	
	for i in $Position2D.get_children():
		i.rotation_degrees = $look_at_base.rotation_degrees
