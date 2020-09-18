extends Camera2D

const PADDING = 8

onready var player = get_node("/root/World/Player")
onready var playerHitbox = get_node("/root/World/Player/CollisionShape2D")

func _process (delta):

	var projectWidth = OS.window_size.x
	var projectHeight = OS.window_size.y
	
	if player.position.x + PADDING * playerHitbox.shape.extents.x / 2 >= position.x + projectWidth / 2:
		position.x = player.position.x + PADDING * playerHitbox.shape.extents.x / 2 - projectWidth / 2
	elif player.position.x - PADDING * playerHitbox.shape.extents.x / 2 <= position.x - projectWidth / 2:
		position.x = player.position.x - PADDING * playerHitbox.shape.extents.x / 2 + projectWidth / 2
	
	if player.position.y + PADDING * playerHitbox.shape.extents.y / 2 >= position.y + projectHeight / 2:
		position.y = player.position.y + PADDING * playerHitbox.shape.extents.y / 2 - projectHeight / 2
	elif player.position.y - PADDING * playerHitbox.shape.extents.y / 2 <= position.y - projectHeight / 2:
		position.y = player.position.y - PADDING * playerHitbox.shape.extents.y / 2 + projectHeight / 2
	
