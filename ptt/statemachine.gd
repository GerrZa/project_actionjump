class_name StateMachine
extends Node

var state = null
@export var init_state = NodePath()
var prev_state = null

signal transitioned

func _ready() -> void:
	await owner.ready
	
	for i in get_children():
		i.fsm = self
	
	state = get_node(init_state)
	state.enter()

func _process(delta: float) -> void:
	state.update(delta)

func _physics_process(delta: float) -> void:
	state.physics_update(delta)

func _input(event: InputEvent) -> void:
	state.input(event)

func transition(state_name:String, msg:={}):
	state.exit()
	prev_state = state
	state = get_node(state_name)
	state.enter(msg)
	
	emit_signal("transitioned")
