class_name StateMachine
extends Node

export var init_state = NodePath()
var state = null

signal state_change(state_name)

func _ready():
	yield(owner,"ready")
	
	for i in get_children():
		i.fsm = self
	
	state = get_node(init_state)
	
	state.start()

func _process(delta):
	state.update(delta)

func _physics_process(delta):
	state.physics_update(delta)

func _unhandled_input(event):
	state.unhandle_input(event)

func _input(event):
	state.input(event)

func transition(state_name, msg:={}):
	state.exit()
	
	state = get_node(state_name)
	
	state.start(msg)
	
	emit_signal("state_change",state_name)
