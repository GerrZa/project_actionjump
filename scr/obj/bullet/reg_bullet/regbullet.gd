extends Area2D

var damage = 30
var cri = false

var speed = 500
var dir = Vector2.ZERO

func _ready():
	look_at(global_position + dir)

func _physics_process(delta):
	global_position += dir * speed * delta

func _on_reg_bullet_area_entered(area):
	if cri:
		area.owner.callv("hurt",damage * 2.5)
	else:
		area.owner.callv("hurt",damage)
	
	queue_free()
