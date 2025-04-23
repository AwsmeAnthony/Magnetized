extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var neck: Node2D = $neck
@onready var emit_partic: CPUParticles2D = $"neck/emit partic"


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("click"):
		var rot_tween : Tween = create_tween()
		neck.look_at(get_global_mouse_position())
		Engine.time_scale = 0.5
		emit_partic.emitting = true
	else:
		Engine.time_scale = 1
	move_and_slide()
