extends Label

func _ready() -> void:
	text = text % int(get_tree().current_scene.name)
