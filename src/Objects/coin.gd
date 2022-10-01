extends Area2D

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var score := 50

func _on_body_entered(_body: Node) -> void:
	picked()

func picked() -> void:
	PlayerData.score += score
	anim_player.play("picked")
