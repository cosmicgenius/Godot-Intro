extends Control

# starts on the level select scene
func _on_StartButton_button_up() -> void:
	get_tree().change_scene(Mechanics.LEVEL_SELECT)

# quits game
func _on_Close_button_up() -> void:
	get_tree().quit()
