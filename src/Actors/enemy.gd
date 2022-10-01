extends Actor

export var score := 100

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -max_speed.x

func _physics_process(delta: float) -> void:
	_velocity.x *= -1 if is_on_wall() else 1
	_velocity.y += gravity * delta
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	die()

func die() -> void:
	PlayerData.score += score
	queue_free()
