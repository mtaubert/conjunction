extends State
class_name PlayerState

func physics_process(delta):
#	velocity.x = 0
#	velocity.z = 0
	pass


func _get_input_vector() -> Vector3:
	var input:Vector3 = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		input.z += 1
	if Input.is_action_pressed("move_backward"):
		input.z -= 1
	if Input.is_action_pressed("move_left"):
		input.x += 1
	if Input.is_action_pressed("move_right"):
		input.x -= 1
	
	return input.normalized()


func _handle_movement(direction:Vector3, delta:float) -> void:
	character.current_velocity.x = direction.x * character.movement_speed
	character.current_velocity.z = direction.z * character.movement_speed
	character.current_velocity.y -= character.gravity * delta


func _push_moveable_rigidbodies() -> void:
	for index in character.get_slide_count():
		var collision = character.get_slide_collision(index)
		if collision.collider.is_in_group("pushable_bodies"):
			collision.collider.apply_central_impulse(-collision.normal * character.current_velocity.length())
