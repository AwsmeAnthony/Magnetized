extends CharacterBody2D
class_name Box

@export var slide : int = 200

var player_vel : Vector2
var grav : Vector2
var player_in : bool = false

func _physics_process(delta: float) -> void:
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
