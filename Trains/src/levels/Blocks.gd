extends TileMap

const Block = preload("res://src/blocks/Block.tscn")
const Enemy = preload("res://src/blocks/Enemy.tscn")
const Train = preload("res://src/blocks/Train.tscn")
const Immovable = preload("res://src/blocks/Immovable.tscn")

const OFFSET: Vector2 = Vector2(4, 4)

const WATER: int = 1

func _ready() -> void:
	var normal_blocks = get_used_cells_by_id(0)
	
	var enemies = get_used_cells_by_id(2)
	
	var right_trains = get_used_cells_by_id(3)
	var up_trains = get_used_cells_by_id(4)
	var left_trains = get_used_cells_by_id(5)
	var down_trains = get_used_cells_by_id(6)
	
	var immovable_blocks = get_used_cells_by_id(7)
	
	_replace_normal_blocks(normal_blocks)
	_replace_trains(right_trains, 0)
	_replace_trains(up_trains, 1)
	_replace_trains(left_trains, 2)
	_replace_trains(down_trains, 3)
	_replace_enemies(enemies)
	_replace_immovable_blocks(immovable_blocks)

func _replace_normal_blocks(tileArr: Array) -> void:
	for i in range(tileArr.size()):
		var new_block = Block.instance()
		new_block.position = OFFSET + map_to_world(tileArr[i])
		set_cell(tileArr[i].x, tileArr[i].y, -1)
		self.add_child(new_block)

func _replace_enemies(tileArr: Array) -> void:
	Mechanics.enemies = tileArr.size()
	for i in range(tileArr.size()):
		var new_enemy = Enemy.instance()
		new_enemy.position = OFFSET + map_to_world(tileArr[i])
		set_cell(tileArr[i].x, tileArr[i].y, -1)
		self.add_child(new_enemy)

func _replace_trains(tileArr: Array, train_move_dir_index: int) -> void:
	for i in range(tileArr.size()):
		var new_train = Train.instance()
		
		new_train.train_move_dir_index = train_move_dir_index
		
		new_train.position = OFFSET + map_to_world(tileArr[i])
		set_cell(tileArr[i].x, tileArr[i].y, -1)
		self.add_child(new_train)

func _replace_immovable_blocks(tileArr: Array) -> void:
	for i in range(tileArr.size()):
		var new_block = Immovable.instance()
		new_block.position = OFFSET + map_to_world(tileArr[i])
		set_cell(tileArr[i].x, tileArr[i].y, -1)
		self.add_child(new_block)

func is_valid(world_pos : Vector2) -> bool:
	return get_cellv(world_to_map(world_pos)) != WATER
