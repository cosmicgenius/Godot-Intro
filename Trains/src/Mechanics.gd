extends Node

onready var tree = get_tree()

var is_moving: bool = false
var enemies: int = 0 setget set_enemies

signal on_win 

func set_enemies(value: int) -> void:
	enemies = value
	if enemies == 0:
		emit_signal("on_win")
		tree.change_scene("res://src/levels/Level_" + str(int(tree.current_scene.name) + 1) + ".tscn")
