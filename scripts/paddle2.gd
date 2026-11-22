extends AnimatableBody2D

var reset_x: int = 0
var speed: int = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	print(position.x)
	if position.x>300:
		speed = -2
	elif position.x<0:
		speed = 2
	position.x += speed

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		body.velocity.y = -600
