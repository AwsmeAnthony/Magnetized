extends Area2D

@export var next_level : PackedScene

@onready var blu: CPUParticles2D = $blu
@onready var red: CPUParticles2D = $red
@onready var marker_2d: Marker2D = $Marker2D
@onready var next_level_node: CanvasLayer = $"next level"

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Engine.time_scale = 1
		next_level_node.next_level = next_level
		body.movement_disabled = true
		var pos_tween : Tween = create_tween()
		pos_tween.tween_property(body,"global_position",marker_2d.global_position,0.3)
		
		var rot_tween : Tween = create_tween()
		rot_tween.tween_property(body.neck,"global_rotation",marker_2d.global_rotation,0.3)
		
		
		await rot_tween.finished
		body.visible = false
		blu.emitting = true
		red.emitting = true
		await red.finished
		next_level_node.visible = true
