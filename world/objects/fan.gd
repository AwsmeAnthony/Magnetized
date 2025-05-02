extends Area2D


@export var offset : Vector2 = Vector2(0,-100)


func _on_body_entered(body: Node2D) -> void:
	if body is Player or body is Box:
		body.offset = offset


func _on_body_exited(body: Node2D) -> void:
	if body is Player or body is Box:
		body.offset = Vector2.ZERO
