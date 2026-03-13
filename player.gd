extends CharacterBody2D

@export var gravity = 200.0
@export var walk_speed = 200
@export var jump_speed = -200
@onready var animplayer = $AnimatedSprite2D
@onready var jump_sound = $jumpSound
var double_jump = true

func _physics_process(delta):
	var animation = "idle"

	velocity.y += gravity * delta

	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
		jump_sound.play()

	if not is_on_floor() and double_jump and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
		double_jump = false
		jump_sound.play()

	if is_on_floor():
		double_jump = true

	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * walk_speed
		animplayer.flip_h = direction < 0
	else:
		velocity.x = 0

	# Animation logic (important part)
	if not is_on_floor():
		animation = "jump"
	elif direction:
		animation = "walk_right"
	else:
		animation = "idle"

	animplayer.play(animation)
		
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  walk_speed
	else:
		velocity.x = 0

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
