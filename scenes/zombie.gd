extends CharacterBody2D

const SPEED = 80.0
var direction = -1

func _physics_process(delta: float) -> void:

	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# horizontal movement
	velocity.x = direction * SPEED

	# move character
	move_and_slide()

	# turn when hitting a wall
	if is_on_wall():
		direction *= -1
