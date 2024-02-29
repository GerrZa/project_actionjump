extends Area2D

export(String, "reg", "sg") var type = "reg"

var ptt_reg_bullet = preload("res://asset/ptt/ptt_dropped_bullet.png")

var spr_ref = {
	"reg" : {"text":ptt_reg_bullet,"offset":Vector2(0,-2)}
}

func _ready():
	$DroppedBullet.texture = spr_ref[type]["text"]
	$DroppedBullet.offset = spr_ref[type]["offset"]

func _on_pickup_bullet_body_entered(body):
	if body is Player:
		if body.hold_bullet.size() < 6:
			body.hold_bullet.push_front(type)
			queue_free()
		else:
			body.emit_signal("bullet_full")
