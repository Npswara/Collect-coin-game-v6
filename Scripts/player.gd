extends CharacterBody2D

const SPEED = 140.0
const JUMP_VELOCITY = -250.0
var coin_counter = 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direction != 0:
		$AnimatedSprite2D.play("walk")
		if direction < 0:
			$AnimatedSprite2D.flip_h = true   # Hadap kiri
		else:
			$AnimatedSprite2D.flip_h = false  # Hadap kanan
	else:
		$AnimatedSprite2D.play("idle")

	move_and_slide()
