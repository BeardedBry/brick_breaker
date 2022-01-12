extends KinematicBody2D
class_name Paddle
#onready var paddle = $self
const SPEED = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("left"):
		global_position.x += -SPEED * delta
	if Input.is_action_pressed("right"):
		global_position.x += SPEED * delta
	global_position.x = clamp(global_position.x, 0, 600)
