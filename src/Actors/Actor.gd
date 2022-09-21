extends KinematicBody2D
class_name Actor

export var gravity := 2000.0
export var maxSpeed := Vector2(300.0, 1000.0)
var currentVelocity := Vector2.ZERO

func _physics_process(delta: float) -> void:
	currentVelocity.y += gravity * delta
