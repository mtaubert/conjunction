extends KinematicBody
class_name Character

export(String) var character_name = "Character"
export(float) var movement_speed = 5.0
export(float) var sprint_modifier = 1.4
export(float) var jump_force = 10.0
export(float) var gravity = 15.0
export(Vector3) var local_gravity_direction = Vector3.DOWN

var current_velocity:Vector3 = Vector3.ZERO

func _ready() -> void:
	connect_signals()


func connect_signals() -> void:
	pass
