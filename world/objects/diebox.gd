extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is Player or body is Box:
		body.dying = true
