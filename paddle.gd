extends CharacterBody2D



const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# if global_position.x 
	print(global_position.x)
