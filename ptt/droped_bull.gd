extends Area2D

@export var is_shotgun = false

func _ready() -> void:
	if is_shotgun:
		$CollisionShape2D/Polygon2D.color = Color(255,0,0)
	else:
		$CollisionShape2D/Polygon2D.color = Color(255,255,255)



func _on_body_entered(body: Node2D) -> void:
	print(body.hold_bullet.size())
	
	var emp_count = body.hold_bullet.count("  ")
	
	if emp_count > 0:
		print("hit")
		if is_shotgun:
			body.hold_bullet.push_front("x")
			body.hold_bullet.remove_at(body.hold_bullet.size() - 1)
			print("add X")
		else:
			body.hold_bullet.push_front("o")
			body.hold_bullet.remove_at(body.hold_bullet.size() - 1)
			print("add O")
	
	queue_free()
	
