extends Area2D

var dir = Vector2.ZERO
@export var hit_plr = false

func _ready() -> void:
	if hit_plr:
		set_collision_mask_value(5,false)
		set_collision_mask_value(1,true)
		
		modulate = Color(255,0,0)
	

func _process(delta: float) -> void:
	look_at(global_position+dir)

func _physics_process(delta: float) -> void:
	global_position += dir * 250 *delta



func _on_body_entered(body: Node2D) -> void:
	body.hurt(30)
	
	if hit_plr:
		queue_free()
