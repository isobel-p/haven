extends Camera2D

@export var decay = 0.8  # How quickly the shaking stops [0, 1].
@export var max_offset = Vector2(100, 75)  # Maximum hor/ver shake in pixels.
@export var max_roll = 0.1  # Maximum rotation in radians (use sparingly).
@export var target: NodePath  # Assign the node this camera will follow.

var trauma = 1.0  # Current shake strength.
var trauma_power = 2  # Trauma exponent. Use [2, 3].

var noise := FastNoiseLite.new()
var noise_y = 0

func _ready():
	noise.seed = 12345
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	noise.frequency = 0.02
	noise.seed = randi()

func shake() -> void:
	var amount := pow(trauma, trauma_power)

	rotation = max_roll * amount * noise.get_noise_2d(0.0, noise_y)
	offset.x = max_offset.x * amount * noise.get_noise_2d(100.0, noise_y)
	offset.y = max_offset.y * amount * noise.get_noise_2d(200.0, noise_y)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target:
		global_position = get_node(target).global_position

	trauma = maxf(trauma - decay * delta, 0.0)

	if trauma > 0.0:
		noise_y += delta * 30.0
		shake()
	else:
		offset = Vector2.ZERO
		rotation = 0.0



func add_trauma(amount):
	trauma = min(trauma + amount, 1.0)
	
