extends Node
class_name StateMachine

signal state_changed(new_state)

export(bool) var DEBUG = false
var state:State


func _ready() -> void:
	state = get_child(0)
	_enter_state(state)


func change_state(new_state:String) -> void:
	var state_node = get_node_or_null(new_state)
	if state_node:
		state = state_node
		_enter_state(state)
		emit_signal("state_changed", new_state)
	else:
		print("Can't find state: " + new_state)


func _enter_state(state:State) -> void:
	if DEBUG:
		print("Entering state: " + state.name)
	state.state_machine = self
	state.character = get_parent()
	state.enter()


func _process(delta) -> void:
	if not state: 
		print("Error, current state is null")
		return
	if state.has_method("process"):
		state.process(delta)


func _physics_process(delta) -> void:
	if not state: 
		print("Error, current state is null")
		return
	if state.has_method("physics_process"):
		state.physics_process(delta)


func _input(event) -> void:
	if not state: 
		print("Error, current state is null")
		return
	if state.has_method("input"):
		state.input(event)


func _unhandled_input(event) -> void:
	if not state: 
		print("Error, current state is null")
		return
	if state.has_method("unhandled_input"):
		state.unhandled_input(event)
