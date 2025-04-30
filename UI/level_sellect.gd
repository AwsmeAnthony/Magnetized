extends CanvasLayer

@onready var ss_rect_1: TextureRect = $HBoxContainer/ss_rect_1
@onready var ss_rect_2: TextureRect = $HBoxContainer/ss_rect_2
@onready var ss_rect_3: TextureRect = $HBoxContainer/ss_rect_3
@onready var label: Label = $Label
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var dir = "res://UI/levelss/"
var levels_dir = "res://world/world/"
var files : Array = []
var level_files : Array = []
var index : int = 0

func _ready() -> void:
	dir = DirAccess.open(dir)
	if dir:
		dir.list_dir_begin()
		for file in dir.get_files():
			var filename = dir.get_files()[dir.get_files().find(file)]
			if not ".import" in filename:
				files.append(str("res://UI/levelss/",file))
		dir.list_dir_end()

	dir = DirAccess.open(levels_dir)
	if dir:
		dir.list_dir_begin()
		for file in dir.get_files():
			var filename = dir.get_files()[dir.get_files().find(file)]
			if "world" in filename:
				level_files.append(str("res://world/world/",file))
		dir.list_dir_end()
	
	print(level_files)

func _process(delta: float) -> void:
	label.text = str("Levels ", index+1, " - ", index+3)
	ss_rect_1.texture = load(files[index])
	ss_rect_2.texture = load(files[index+1])
	ss_rect_3.texture = load(files[index+2])


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _on_left_pressed() -> void:
	if index > 0:
		index-= 1
		audio_stream_player.play()


func _on_right_pressed() -> void:
	if index + 3 < len(files):
		index += 1
		audio_stream_player.play()


func _on_l_1_pressed() -> void:
	get_tree().change_scene_to_file(level_files[index])


func _on_l_2_pressed() -> void:
	get_tree().change_scene_to_file(level_files[index + 1])


func _on_l_3_pressed() -> void:
	get_tree().change_scene_to_file(level_files[index + 2])
