extends CanvasLayer

@onready var ss_rect_1: TextureRect = $HBoxContainer/ss_rect_1
@onready var ss_rect_2: TextureRect = $HBoxContainer/ss_rect_2
@onready var ss_rect_3: TextureRect = $HBoxContainer/ss_rect_3
@onready var label: Label = $Label
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var dir = "res://UI/levelss/"
var levels_dir = "res://world/world/"
var files : Array = ["res://UI/levelss/Screenshot 2025-04-29 163844.png","res://UI/levelss/Screenshot 2025-04-29 163907.png",  "res://UI/levelss/Screenshot 2025-04-29 163944.png","res://UI/levelss/Screenshot 2025-04-29 163950.png", "res://UI/levelss/Screenshot 2025-04-29 164010.png",  "res://UI/levelss/Screenshot 2025-04-29 164028.png", "res://UI/levelss/Screenshot 2025-04-29 164048.png", "res://UI/levelss/Screenshot 2025-04-29 164102.png", "res://UI/levelss/Screenshot 2025-04-29 164131.png", "res://UI/levelss/Screenshot 2025-05-01 231345.png", "res://UI/levelss/Screenshot 2025-05-02 131713.png", "res://UI/levelss/Screenshot 2025-05-02 160114.png"]
var level_files : Array = ["res://world/world/world.tscn", "res://world/world/world_1.tscn", "res://world/world/world_2.tscn", "res://world/world/world_4.tscn", "res://world/world/world_5.tscn", "res://world/world/world_6.tscn", "res://world/world/world_7.tscn", "res://world/world/world_8.tscn", "res://world/world/world_9.tscn", "res://world/world/world_10.tscn", "res://world/world/world_11.tscn", "res://world/world/world_12.tscn"]
var index : int = 0

#func _ready() -> void:
	#dir = DirAccess.open(dir)
	#if dir:
		#dir.list_dir_begin()
		#for file in dir.get_files():
			#var filename = dir.get_files()[dir.get_files().find(file)]
			#if not ".import" in filename:
				#files.append(str("res://UI/levelss/",file))
		#dir.list_dir_end()
#
	#dir = DirAccess.open(levels_dir)
	#if dir:
		#dir.list_dir_begin()
		#for file in dir.get_files():
			#var filename = dir.get_files()[dir.get_files().find(file)]
			#if "world" in filename:
				#level_files.append(str("res://world/world/",file))
		#dir.list_dir_end()
	#
	#printt(files,level_files)
	#

func _process(delta: float) -> void:
	Pause.visible = false
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
