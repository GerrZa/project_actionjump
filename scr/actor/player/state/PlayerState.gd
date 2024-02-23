class_name PlayerState
extends State

var plr : Player = null

func _ready() -> void:
	await owner.ready
	
	if owner is Player:
		plr = owner
	
	assert(plr != null)
