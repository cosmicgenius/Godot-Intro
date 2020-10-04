extends Node

onready var tree = get_tree()

var is_moving: bool = false
var enemies: int = 0 setget set_enemies

var max_levels = 12
const LEVEL_PREFIX: String = "res://src/levels/%s/Level_"

const LEVEL_SELECT: String = "res://src/ui/LevelSelect.tscn"
const WIN_SCREEN: String = "res://src/ui/WinScreen.tscn"

signal on_win 

func _ready() -> void:
#	check how many levels exist of the form level prefix + integer
#	var file = File.new()
#	while file.file_exists(LEVEL_PREFIX + str(total_levels + 1) + ".tscn"):
#		total_levels += 1
	pass

func set_enemies(value: int) -> void:
	enemies = value
	
	# win when enemies hits 0
	if enemies == 0:
		emit_signal("on_win")
		_go_to_next_level()

# goes to next level by getting the integer part of the current level scene and 
# adding 1, then appending to the level prefix
func _go_to_next_level() -> void:
	var current_level = int(tree.current_scene.filename)
	
	# check if this isn't the last level
	if current_level != max_levels:
		tree.change_scene(LEVEL_PREFIX % tree.current_scene.filename.split("/")[4] + str(current_level + 1) + ".tscn")
	else:
		tree.change_scene(WIN_SCREEN)
