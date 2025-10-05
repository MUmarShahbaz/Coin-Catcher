extends CharacterBody2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var sprite: AnimatedSprite2D
@export var jump_sfx: AudioStreamPlayer

var facing: int = 1
var begin: bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if not begin: return
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sfx.play()

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		sprite.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sprite.play("default")

	if facing * direction < 0:
		sprite.flip_h = !sprite.flip_h
		facing *= -1

	move_and_slide()

func enable():
	begin = true
