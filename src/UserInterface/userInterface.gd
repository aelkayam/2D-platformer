extends Control

onready var scene_tree := get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var score: Label = get_node("Label")
onready var title: Label = get_node("PauseOverlay/Title")

const DIED_TITLE = "You Died"

var paused := false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()

func _on_PlayerData_player_died() -> void:
	self.paused = true
	title.text = DIED_TITLE
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and title.text != DIED_TITLE:
		self.paused = not paused
		scene_tree.set_input_as_handled()

func update_interface() -> void:
	score.text = "Score: %s" % PlayerData.score	

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
