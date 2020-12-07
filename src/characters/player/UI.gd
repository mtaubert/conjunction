extends Control


func update_state(new_state:String) -> void:
	$DebugStateLabel.text = "Current State: " + new_state
