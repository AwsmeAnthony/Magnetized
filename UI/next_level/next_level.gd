extends CanvasLayer

var next_level : PackedScene


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(next_level)
