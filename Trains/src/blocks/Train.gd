extends Block

var train_dir_index: int = 0

func _ready() -> void:
	_set_sprite(train_dir_index)
	ray.cast_to = move_dir[train_dir_index] * size

func _set_sprite(move_dir_index: int) -> void:
	sprite.frame = move_dir_index

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		self._on_click()

func _on_click() -> void:
	if not Mechanics.is_moving:
		Mechanics.is_moving = true
		self.start_movement(train_dir_index)

func _finish_movement(move_dir_index: int) -> void:
	Mechanics.is_moving = false
	._finish_movement(move_dir_index)
