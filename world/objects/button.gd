extends Area2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
var pressed : bool = false
var inside : Array = []

func _physics_process(delta: float) -> void:
	if len(inside) == 0:
		pressed = false
	else:
		pressed = true

func _on_body_entered(body: Node2D) -> void:
	animation_player.play("press")
	inside.append(body)


func _on_body_exited(body: Node2D) -> void:
	animation_player.play_backwards("body_exited")
	inside.remove_at(inside.find(body))
