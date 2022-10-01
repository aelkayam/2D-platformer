extends Control

onready var score: Label = get_node("Score")

func _ready() -> void:
	score.text = score.text % [PlayerData.score, PlayerData.deaths]
