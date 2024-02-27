class_name PlayerState
extends State

var plr : Player = null

func _ready():
	yield(owner,"ready")
	
	if owner is Player:
		plr = owner
	
	assert(plr!=null)
