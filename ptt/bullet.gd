extends Area2D

var dir = Vector2.ZERO
@export var hit_plr = false

func _process(delta: float) -> void:
	
	if hit_plr:
		set_collision_mask_value(5,true)
		set_collision_mask_value(3,false)
		
		modulate = Color(255,0,0)
	
	look_at(global_position+dir)

func _physics_process(delta: float) -> void:
	global_position += dir * 30



func _on_body_entered(body: Node2D) -> void:
	body.hurt(30)
