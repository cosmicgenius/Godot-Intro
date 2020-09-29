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

# tries to move the block
# if works is true, then it actually moves
# otherwise, it just trembles
func try_move(works: bool) -> void:
	if works:
		anim_player.play(MOVE_PREFIX + MOVE_ANIM_NAME[move_dir_index])
	else:
		anim_player.play(TREMBLE_PREFIX + MOVE_ANIM_NAME[move_dir_index])
	
	var next_block: Block = _block_toward(MOVE_DIR[move_dir_index] * size)
	if next_block != null:
		next_block.try_move(works)

# sets the move dir index and returns if the block can move in that direction
func set_move_dir_index(new_index: int) -> bool:
	move_dir_index = new_index
	
	var next_block: Block = _block_toward(MOVE_DIR[new_index] * size)
	if next_block != null:
		return next_block.set_move_dir_index(new_index)
	return true

func _block_toward(direction: Vector2) -> Block:
	ray.cast_to = direction
	ray.force_raycast_update()
	
	var next_block_area_2d = ray.get_collider()
	
	if next_block_area_2d != null:
		return next_block_area_2d.get_parent()
	return null;


func _finish_movement(move_dir_index: int) -> void:
	sprite.position = Vector2(0, 0)
	self.position += MOVE_DIR[move_dir_index] * size;
	
	if not self.get_parent().is_valid(position):
		_die()
#		print (Mechanics.enemies)

func _die() -> void:
	queue_free()
