extends Character
class_name Player


func _ready() -> void:
	EventBus.emit_signal("player_entered_scene", self)


func connect_signals() -> void:
	.connect_signals()
	
	$StateMachine.connect("state_changed", $UICanvasLayer/UI, "update_state")


func get_camera_anchor() -> Node:
	return $CameraAnchor
