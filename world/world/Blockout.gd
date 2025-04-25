extends Polygon2D
class_name Blockout2D

@onready var walls := $StaticBody2D/Walls
@export var partic_color : Color = Color.BLACK

@export var sound : String = "concrete-footsteps-1.mp3"


func _ready():
	walls.polygon = polygon
