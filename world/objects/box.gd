extends CharacterBody2D
class_name Box

@export var slide : int = 200
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var partic: CPUParticles2D = $partic

var player_vel : Vector2
var grav : Vector2
var player_in : bool = false
var dying : bool = false

func _physics_process(delta: float) -> void:
	if dying:
		_die()
		return
		
	grav.y += 5
	if grav.y > 200:
		grav.y = 200
	if is_on_floor():
		grav.y = 0 
	
	if not player_in:
		player_vel = Vector2.ZERO
		#player_vel.y = 0
		#if player_vel != Vector2.ZERO:
			#var x_tween : Tween = create_tween()
			#x_tween.tween_property(self,"player_vel",Vector2(0,0),0.1)
	
	velocity = (player_vel * slide) + grav
	move_and_slide()

func _die():
	polygon_2d.visible = false
	partic.emitting = true
	await partic.finished
	queue_free()
