class_name StateMachine
extends Node

@export var init_state = NodePath()
var state = null
var prev_state = null

signal state_change(state_name)

func _ready() -> void:
	await owner.ready
	
	for i in get_children():
		i.fsm = self
	
	state = get_node(init_state)
	
	state.enter()

func _physics_process(delta: float) -> void:
	state.physics_update(delta)

func _process(delta: float) -> void:
	state.update(delta)

func _unhandled_input(event: InputEvent) -> void:
	state.unhandle_input(event)

func _input(event: InputEvent) -> void:
	state.input(event)

func transition(state_name:String,msg:={}):
	state.exit()
	
	prev_state = state
	
	state = get_node(state_name)
	emit_signal("state_change",state_name)
	
	state.enter(msg)
	
