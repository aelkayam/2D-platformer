extends Actor

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -max_speed.x

#	enemy killed event
func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	queue_free()

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	
#	change direction
	if is_on_wall():
		_velocity.x *= -1.0
	
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
