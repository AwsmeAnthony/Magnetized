extends CanvasLayer

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		if visible:
			visible = false
		else:
			visible = true

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	visible = false


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
	visible = false
