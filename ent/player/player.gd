extends CharacterBody2D


@onready var sprite: Sprite2D = $Sprite2D
@onready var neck: Node2D = $neck
@onready var emit_partic: CPUParticles2D = $"neck/emit partic"
@onready var neg: RayCast2D = $neck/neg
@onready var pos: RayCast2D = $neck/pos


func _physics_process(delta: float) -> void:
	_move()
	_align_rotation()
	

	if not neg.is_colliding() and not pos.is_colliding():
		velocity = Vector2.RIGHT.rotated(neck.rotation) * 300 
	else:
		velocity = Vector2.ZERO

func _align_rotation():	
	if neg.is_colliding() and not pos.is_colliding():
		neck.rotation += deg_to_rad(10)
	if not neg.is_colliding() and pos.is_colliding():
		neck.rotation -= deg_to_rad(10)


func _move():
	if Input.is_action_pressed("click"):
		var rot_tween : Tween = create_tween()
		neck.look_at(get_global_mouse_position())
		Engine.time_scale = 0.008
		emit_partic.emitting = true
	else:
		Engine.time_scale = 1
	
	move_and_slide()
