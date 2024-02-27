extends Node


var critical_mul = 2.5 # How much base damage will be multiply when bullet apply critical

#BULLET SCENE LIST
var reg_bullet = preload("res://scr/obj/bullet/reg_bullet/reg_bullet.tscn")

var b_ref ={ #Global Reference to call
	"reg": reg_bullet
}

func shoot_bullet(bullet_type:String, pos:Vector2, direction:Vector2):
	if !b_ref.has(bullet_type):
		return
	
	var bullet = b_ref[bullet_type].instance()
	
	bullet.global_position = pos
	bullet.dir = direction
	
	get_tree().current_scene.add_child(bullet)

