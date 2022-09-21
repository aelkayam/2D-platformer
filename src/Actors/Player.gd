extends Actor

func _physics_process(delta: float) -> void:
	
	var currentDirection := get_direction()
	
	currentVelocity = maxSpeed * currentDirection
	currentVelocity = move_and_slide(currentVelocity, Vector2.UP)

#	Convert the intensity of pressing a direction key, to a vector which represents
#	the direction of movement.
#	x axis: -1 (left) to 1 (right), y axis: -1 (jump) to 1 (floor)
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)

#func calculate_move_velocity() -> void:
#	return
#
	
