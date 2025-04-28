extends Area2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
var pressed : bool = false

func _on_body_entered(body: Node2D) -> void:
	animation_player.play("press")
	pressed = true


func _on_body_exited(body: Node2D) -> void:
	animation_player.play_backwards("body_exited")
	pressed = false
