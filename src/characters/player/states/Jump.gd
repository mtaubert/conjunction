extends PlayerState

var running_start:bool = false

func enter() -> void:
	if Input.is_action_pressed("sprint"): running_start = true
	character.current_velocity.y = character.jump_force


func exit() -> void:
	running_start = false
	state_machine.change_state("Idle")


func physics_process(delta:float):
	.physics_process(delta)
	var input:Vector3 = _get_input_vector()
	input.x = 0
	input.z = clamp(input.z, 0, 1)
	input.normalized()
	
	var direction:Vector3 = (character.transform.basis.z * input.z + character.transform.basis.x * input.x)
	if running_start:
			direction *= character.sprint_modifier
	_handle_movement(direction, delta)
	
	if character.is_on_floor():
		exit()


func _handle_movement(direction:Vector3, delta:float) -> void:
	._handle_movement(direction, delta)
	
	character.current_velocity = character.move_and_slide(character.current_velocity, Vector3.UP, true, 4, PI/4, false)
