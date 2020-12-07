extends Spatial

export(float) var look_sensitivity := 15.0
export(float) var minimum_view_angle := -20.0
export(float) var maximum_view_angle := 75.0

var mouse_delta: Vector2 = Vector2.ZERO

onready var player:KinematicBody = get_parent()

#func _ready() -> void:
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event:InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_delta = event.relative

func _process(delta) -> void:
	var camera_rotation:Vector3 = Vector3(mouse_delta.y, mouse_delta.x, 0) * look_sensitivity * delta
	
	rotation_degrees.x += camera_rotation.x
	rotation_degrees.x = clamp(rotation_degrees.x, minimum_view_angle, maximum_view_angle)
	
	player.rotation_degrees.y -= camera_rotation.y
	
	mouse_delta = Vector2()
