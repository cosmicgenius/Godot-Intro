extends Node

onready var tree = get_tree()

var is_moving: bool = false
var enemies: int = 0 setget set_enemies

var total_levels = 0
const LEVEL_PREFIX: String = "res://src/levels/Level_"

signal on_win 

func _ready() -> void:
	# check how many levels exist of the form level prefix + integer
	var file = File.new()
	while file.file_exists(LEVEL_PREFIX + str(total_levels + 1) + ".tscn"):
		total_levels += 1

func set_enemies(value: int) -> void:
	enemies = value
	
	# win when enemies hits 0
	if enemies == 0:
		emit_signal("on_win")
		_go_to_next_level()

# goes to next level by getting the integer part of the current level scene and 
# adding 1, then appending to the level prefix
func _go_to_next_level() -> void:
	var current_level = int(tree.current_scene.name)
	# check if this isn't the last level
	if current_level != total_levels:
		tree.change_scene(LEVEL_PREFIX + str(current_level + 1) + ".tscn")
	else:
		tree.change_scene("res://src/ui/WinScreen.tscn")
