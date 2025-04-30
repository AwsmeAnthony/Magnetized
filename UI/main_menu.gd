extends CanvasLayer

@onready var volume: TextureButton = $volume

func _ready() -> void:
	if Music.volume_db == -60:
		volume.modulate = Color.RED
	preload("res://world/world/world.tscn")
	preload("res://UI/credit_menu.tscn")




func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world/world/world.tscn")
	Pause.visible = false


func _on_levels_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/level_sellect.tscn")


func _on_credits_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/credit_menu.tscn")


func _on_exit_button_4_pressed() -> void:
	get_tree().quit()


func _on_volume_pressed() -> void:
	if Music.volume_db == -60:
		Music.volume_db = 0
		volume.modulate = Color.WHITE
	else:
		Music.volume_db = -60
		volume.modulate = Color.RED
