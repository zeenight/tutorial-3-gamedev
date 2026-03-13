extends CharacterBody2D

const SPEED = 80.0
var direction = -1
const JUMP_FORCE = -300.0
@onready var sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:

	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# zombie movement
	velocity.x = direction * SPEED

	# zombie jump when hitting wall
	if is_on_wall() and is_on_floor():
		velocity.y = JUMP_FORCE
		direction *= -1

	move_and_slide()

	# flip sprite depending on direction
	sprite.flip_h = direction > 0

	# animation logic
	if not is_on_floor():
		sprite.play("jump")
	elif velocity.x != 0:
		sprite.play("walk")
	else:
		sprite.play("idle")


func _on_area_2d_body_entered(body: Node2D) -> void:
	var music = $AudioStreamPlayer2D
	if body.name == "Player":
		music.play()
		body.queue_free()  # player disappears
