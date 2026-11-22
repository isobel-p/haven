extends CharacterBody2D



const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	velocity.x = 100

func _physics_process(delta: float) -> void:
	# if global_position.x 
	
	print(position.x)
	if position.x>300:
		velocity.x=-100
	elif position.x<0:
		velocity.x=100
	move_and_slide()
