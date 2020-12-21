extends PlayerState

func enter() -> void:
	character.current_velocity = Vector3.ZERO


func physics_process(delta:float) -> void:
	if _get_input_vector() != Vector3.ZERO:
		state_machine.change_state("Move")
		return
	if Input.is_action_pressed("jump") and character.is_on_floor():
		state_machine.change_state("Jump")
		return
	
	character.current_velocity.y -= character.gravity * delta
	character.current_velocity = character.move_and_slide_with_snap(character.current_velocity, character.local_gravity_direction, Vector3.UP, true, 4, PI/4, false)
