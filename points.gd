extends Node2D
@onready var score: RichTextLabel = $RichTextLabel
var points: int = 0
var text: String = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Points:" + str(points)
	score.text = text

func _on_point() -> void:
	points += 1
