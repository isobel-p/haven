extends CharacterBody2D



const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# if global_position.x 
	var x_delta = body.position.x - position.x
	print(x_delta)
