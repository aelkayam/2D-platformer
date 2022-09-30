tool
extends Button

export(String, FILE) var change_scene_path := ""

func _on_button_up() -> void:
	var _success = get_tree().change_scene(change_scene_path)

func _get_configuration_warning() -> String:
	return "change_scene_path must be set for the button to work" if change_scene_path == "" else ""
