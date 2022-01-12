extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200
var direction = Vector2(0, 1)

onready var BallContainer = get_node("/root/Game/BallContainer")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position += direction * speed * delta


func _on_Ball_area_entered(area):
	if area is Paddle:
		print(area)
		direction.y *= -1
		direction.x = (global_position.x - area.position.x) / 16
	elif area is Wall:
		if area.wall_type == Wall.WallType.TOP:
			direction.y *= -1
		elif area.wall_type == Wall.WallType.SIDE:
			direction.x *= -1
		elif area.wall_type == Wall.WallType.BOTTOM:
			queue_free()
	elif area is Brick:
		print(get_class())
		area.queue_free()
