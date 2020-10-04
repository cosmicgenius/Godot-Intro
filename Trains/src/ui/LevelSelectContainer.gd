extends GridContainer

const LevelSelectButton = preload("res://src/ui/LevelSelectButton.tscn")

func _ready() -> void:
	_add_level_selects(Mechanics.max_levels)
	
func _add_level_selects(max_levels: int) -> void:
	for i in range(max_levels):
		var new_button = LevelSelectButton.instance()
		new_button.text = str(i + 1)
		new_button.section = self.name
		self.add_child(new_button)
