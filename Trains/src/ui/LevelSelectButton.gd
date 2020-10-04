extends Button

var section: String

func _on_button_up() -> void:
	get_tree().change_scene(Mechanics.LEVEL_PREFIX % section + str(self.text) + ".tscn")
