extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL = Vector2.UP

export var gravity := 4000.0
export var max_speed := Vector2(400.0, 1200.0)

var _velocity := Vector2.ZERO
