extends Block

func _die() -> void:
	Mechanics.enemies -= 1
	._die()
