extends CanvasLayer

@onready var label_2: Label = $TextureRect/Label2

var next_level : PackedScene
var clicks : int = 0

func _physics_process(delta: float) -> void:
	label_2.text = str("clicks:",clicks)
	if Input.is_action_just_pressed("click") and not visible:
		clicks += 1

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(next_level)


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
