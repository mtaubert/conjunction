extends PlayerState

func physics_process(delta):
	.physics_process(delta)
	
	if Input.is_action_pressed("jump") and character.is_on_floor():
		state_machine.change_state("Jump")
		return
	
	var input:Vector3 = _get_input_vector()
	
	if input == Vector3.ZERO:
		state_machine.change_state("Idle")
	else :
		var direction:Vector3 = (character.transform.basis.z * input.z + character.transform.basis.x * input.x)
		if Input.is_action_pressed("sprint"):
			direction *= character.sprint_modifier
		_handle_movement(direction, delta)


func _handle_movement(direction:Vector3, delta:float) -> void:
	._handle_movement(direction, delta)
	
	character.current_velocity = character.move_and_slide_with_snap(character.current_velocity, character.local_gravity_direction, Vector3.UP, true, 4, PI/4, false)
	_push_moveable_rigidbodies()
