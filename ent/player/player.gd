extends CharacterBody2D
class_name Player

@onready var sprite: Sprite2D = $neck/Sprite2D
@onready var neck: Node2D = $neck
@onready var emit_partic: CPUParticles2D = $"neck/emit partic"
@onready var neg: RayCast2D = $neck/neg
@onready var pos: RayCast2D = $neck/pos
@onready var is_on_wall_cast: ShapeCast2D = $"neck/is on wall"
@onready var pointer: Line2D = $neck/pointer
@onready var fly_partics: CPUParticles2D = $"neck/fly partics"
@onready var blu: CPUParticles2D = $neck/blu
@onready var red: CPUParticles2D = $neck/red

var offset : Vector2 = Vector2(0,0)
var dying : bool = false
var movement_disabled : bool = false

func _physics_process(delta: float) -> void:
	if movement_disabled:
		return
	
	_die()
	if dying:
		return
	
	_move()
	_align_rotation()
	

	if not neg.is_colliding() and not pos.is_colliding():
		if not is_on_wall_cast.is_colliding():
			velocity.y += 5
			if velocity.y > 200:
				velocity.y = 200
			velocity += offset
			fly_partics.visible = false
			return
		velocity = (Vector2.RIGHT.rotated(neck.rotation) * 300) + offset
		fly_partics.visible = true
	if neg.is_colliding() and pos.is_colliding():
		velocity = Vector2.ZERO
		fly_partics.visible = false


func _die():
	if Input.is_action_just_pressed("restart"):
		dying = true
		
	if not dying:
		return
	
	blu.emitting = true
	red.emitting = true
	sprite.visible = false
	

func _align_rotation():	
	if neg.is_colliding() and not pos.is_colliding():
		neck.rotation += deg_to_rad(10)
	if not neg.is_colliding() and pos.is_colliding():
		neck.rotation -= deg_to_rad(10)


func _move():
	if Input.is_action_pressed("click"):
		pointer.visible = true
		var rot_tween : Tween = create_tween()
		neck.look_at(get_global_mouse_position())
		Engine.time_scale = 0.008
		emit_partic.emitting = true
	else:
		pointer.visible = false
		Engine.time_scale = 1
	
	move_and_slide()


func _on_blu_finished() -> void:
	get_tree().reload_current_scene()
