extends Area2D

onready var anim_player: = $AnimationPlayer
export var score: = 100

func _on_body_entered(body: Node) -> void:
	collected()

func collected() -> void:
	PlayerData.score += score
	anim_player.play("fade_out")
	monitoring = false
