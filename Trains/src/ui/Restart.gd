extends Node2D

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# check for left mouse button click
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		get_tree().reload_current_scene()
