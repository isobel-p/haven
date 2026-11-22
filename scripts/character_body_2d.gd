extends CharacterBody2D

var jumps: int = 2

func respawn() -> void:
	print("Respawning...")
	global_position.x = 17.5
	global_position.y = 0

func _ready() -> void:
	#$Error.play()
	respawn()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * 300
	else:
		velocity.x = move_toward(velocity.x, 0, 300)

	if position.y > 300:
		respawn()


	move_and_slide()
