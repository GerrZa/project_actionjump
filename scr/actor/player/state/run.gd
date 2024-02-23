extends PlayerState

func _physics_process(delta: float) -> void:
	plr.velocity = plr.velocity.move_toward(plr.p_input * plr.speed,plr.acc)
	
	plr.move_and_slide()

func update(delta):
	if plr.p_input == Vector2.ZERO:
		fsm.transition("idle")
	
