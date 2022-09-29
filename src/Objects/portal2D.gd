tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
export var next_level: PackedScene

func _on_body_entered(body: PhysicsBody2D) -> void:
	teleport()

# to prevent bugs
func _get_configuration_warning() -> String:
	return "The next scene property must be initiallized" if not next_level else ""

func teleport() -> void:
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_level)

