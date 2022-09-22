extends Actor

func _physics_process(_delta: float) -> void:
	var is_jump_interrupted := Input.is_action_just_released("jump") and _velocity.y < 0.0
	var current_direction := get_direction()
	_velocity = calculate_move_velocity(_velocity, current_direction, max_speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

#	Convert the intensity of pressing a direction key, to a vector which represents
#	the direction of movement.
#	x axis: -1 (left) to 1 (right), y axis: -1 (jump) to 1 (floor)
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)

#	Calculate the next movement velocity vector
func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	 ) -> Vector2:
		var out = linear_velocity
		out.x = speed.x * direction.x
		out.y += gravity * get_physics_process_delta_time()
		
		#	jump velocity:
		if direction.y == -1.0:
			out.y = direction.y * speed.y
		
		#	jump cancel:
		if is_jump_interrupted:
			out.y = 0.0
		return out
