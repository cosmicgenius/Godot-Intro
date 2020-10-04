extends Block

var domino_direction: int = 1
onready var collision_shape = $Area2D/CollisionShape2D

func _ready() -> void:
	if domino_direction == 0:
		_self_block_pos = [Vector2(4, 0), Vector2(-4, 0)]
		collision_shape.scale = Vector2(2, 1)
	else: 
		_self_block_pos = [Vector2(0, 4), Vector2(0, -4)]
		collision_shape.scale = Vector2(1, 2)
		
	_set_sprite(domino_direction)

func _set_sprite(domino_direction: int) -> void:
	if domino_direction == 0:
		sprite.region_rect = Rect2(32, 0, 16, 8)
	else: 
		sprite.region_rect = Rect2(24, 0, 8, 16)
