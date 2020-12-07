extends Character
class_name Player


func connect_signals() -> void:
	.connect_signals()
	
	$StateMachine.connect("state_changed", $UICanvasLayer/UI, "update_state")
