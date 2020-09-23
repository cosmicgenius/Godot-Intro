extends Node2D
class_name Block

onready var anim_player = $AnimationPlayer
onready var sprite = $sprite
onready var ray = $Area2D/RayCast2D

const size = 8
const move_dir: = [Vector2(1, 0), Vector2(0, -1), Vector2(-1, 0), Vector2(0, 1)]
const move_anim_name: = ["move_right", "move_up", "move_left", "move_down"]

func start_movement(move_dir_index: int) -> void:
	anim_player.play(move_anim_name[move_dir_index])
	_ray_cast(move_dir_index)
	
func _ray_cast(move_dir_index : int) -> void:
	ray.cast_to = move_dir[move_dir_index] * size
	
	# bug with godot?
	# raycast first picks next_block to be the one on the right, 
	# then changes cast_to even though the assignment is first 
	yield(get_tree().create_timer(0.0001), "timeout")
	
	var next_block = ray.get_collider();
	print(next_block)
	
	if next_block != null:
		print(next_block.get_parent().position)
		next_block.get_parent().start_movement(move_dir_index)


func _finish_movement(move_dir_index: int) -> void:
	sprite.position = Vector2(0, 0)
	self.position += move_dir[move_dir_index] * size;
	
	if not self.get_parent().is_valid(position):
		queue_free()
