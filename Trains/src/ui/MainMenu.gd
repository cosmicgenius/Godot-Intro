extends Control

# starts on level 1
func _on_StartButton_button_up() -> void:
	get_tree().change_scene(Mechanics.LEVEL_PREFIX + "1.tscn")

# quits game
func _on_Close_button_up() -> void:
	get_tree().quit()
