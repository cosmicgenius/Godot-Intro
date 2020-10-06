extends Button

var scene

func _on_button_up() -> void:
	get_tree().change_scene_to(scene)

func set_scene(section: String) -> void:
	var scene_filename = Mechanics.LEVEL_PREFIX % section + str(self.text) + ".tscn"
	scene = load(scene_filename)
