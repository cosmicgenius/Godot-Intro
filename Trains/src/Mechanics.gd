extends Node

onready var tree = get_tree()

var is_moving: bool = false
var enemies: int = 0 setget set_enemies

const LEVEL_PREFIX: String = "res://src/levels/Level"

signal on_win 

func set_enemies(value: int) -> void:
	enemies = value
	if enemies == 0:
		emit_signal("on_win")
		tree.change_scene(LEVEL_PREFIX + "_" + str(int(tree.current_scene.name) + 1) + ".tscn")
