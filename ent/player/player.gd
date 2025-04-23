extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var neck: Node2D = $neck
@onready var emit_partic: CPUParticles2D = $"neck/emit partic"
@onready var neg: RayCast2D = $neck/neg
@onready var pos: RayCast2D = $neck/pos


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("click"):
		var rot_tween : Tween = create_tween()
		neck.look_at(get_global_mouse_position())
		Engine.time_scale = 0.3
		emit_partic.emitting = true
	else:
		Engine.time_scale = 1
	
	velocity = Vector2.RIGHT.rotated(neck.rotation) * 100
	move_and_slide()
