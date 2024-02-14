extends Area2D

var dir = Vector2.ZERO

func _process(delta: float) -> void:
	look_at(global_position+dir)

func _physics_process(delta: float) -> void:
	global_position += dir * 30



func _on_body_entered(body: Node2D) -> void:
	body.hurt(30)
