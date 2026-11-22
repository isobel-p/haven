extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jumps: int = 2

func _ready() -> void:
	global_position.x = 100
	global_position.y = -100

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumps = 2

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jumps > 0:
		velocity.y = JUMP_VELOCITY
		jumps -= 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()

func on_powerup():
	print("powerup")
<<<<<<< HEAD
	
=======


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if y_delta > 130:
			body.jump()
>>>>>>> 90329abfb55d84b65f1315a3eaf49b42fcb7553a
