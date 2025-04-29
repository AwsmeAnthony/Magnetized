extends StaticBody2D

@export var button : Node2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var polygon_2d: Polygon2D = $Polygon2D

func _process(delta: float) -> void:
	if button == null:
		return
	if button.pressed:
		collision_shape_2d.disabled = true
		polygon_2d.visible = false
	else:
		collision_shape_2d.disabled = false
		polygon_2d.visible = true
		
