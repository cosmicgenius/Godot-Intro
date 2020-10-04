extends Node2D
class_name Block

onready var anim_player = $AnimationPlayer
onready var sprite = $sprite
onready var ray = $Area2D/RayCast2D

const size = 8
const MOVE_DIR: = [Vector2(1, 0), Vector2(0, -1), Vector2(-1, 0), Vector2(0, 1)]
const MOVE_PREFIX = "move_"
const TREMBLE_PREFIX = "tremble_"
const MOVE_ANIM_NAME: = ["right", "up", "left", "down"]

var move_dir_index: int = 0

var _self_block_pos: Array = [Vector2.ZERO]
var _targets: Array = []

# tries to move the block
# if works is true, then it actually moves
# otherwise, it just trembles
func try_move(works: bool) -> void:
	if works:
		anim_player.play(MOVE_PREFIX + MOVE_ANIM_NAME[move_dir_index])
	else:
		anim_player.play(TREMBLE_PREFIX + MOVE_ANIM_NAME[move_dir_index])
	
	for block in _targets:
		block.try_move(works)

# sets the move dir index and returns if the block can move in that direction
func set_move_dir_index(new_index: int) -> bool:
	move_dir_index = new_index
	
	_find_targets_toward(MOVE_DIR[new_index] * size)
	
	var can_move: bool = true 
	for block in _targets:
		can_move = can_move and block.set_move_dir_index(new_index)
	
	return can_move

func _find_targets_toward(direction: Vector2) -> void:
	_targets = []
	for pos in _self_block_pos:
		ray.cast_to = direction
		ray.position = pos
		ray.force_raycast_update()
		
		var next_block_area_2d = ray.get_collider()
		
		if next_block_area_2d != null:
			_targets.append(next_block_area_2d.get_parent())


func _finish_movement(move_dir_index: int) -> void:
	sprite.position = Vector2(0, 0)
	self.position += MOVE_DIR[move_dir_index] * size;
	
	if not _is_valid_spot():
		_die()
#		print (Mechanics.enemies)

func _is_valid_spot() -> bool:
	for pos in _self_block_pos:
		if not self.get_parent().is_valid(position + pos):
			return false
	return true

func _die() -> void:
	queue_free()
