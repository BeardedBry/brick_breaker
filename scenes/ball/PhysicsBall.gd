extends KinematicBody2D

#var speed = 200
var direction = Vector2.ZERO
var speed = -200

onready var BallContainer = get_node("/root/Game/BallContainer")
# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(40,200)
	

func _physics_process(delta):
	var collision = move_and_collide(direction * delta)
	if collision:
		var altered_angle = 0
		var reflect = collision.remainder.bounce(collision.normal)
		direction = direction.bounce(collision.normal)
		if(collision.collider is Paddle):
			if(speed > -350):
				speed -= 1
			altered_angle = collision.position.x - collision.collider.global_position.x
			direction.x = (direction.x / 6) + (altered_angle * 4.0)
			direction.y = speed
#			print('paddle', direction.y)
		elif collision.collider is Brick:
			collision.collider.queue_free()
		print(direction.y)
		move_and_collide(reflect)

func _on_PhysicsBall_body_entered(area):
	move_toward(0, 0, -100)
	pass
#	if area is Paddle:
##		print(area)
#		direction.y *= -1
#		direction.x = (global_position.x - area.position.x) / 16
#	elif area is Wall:
#		if area.wall_type == Wall.WallType.TOP:
#			direction.y *= -1
#		elif area.wall_type == Wall.WallType.SIDE:
#			direction.x *= -1
#		elif area.wall_type == Wall.WallType.BOTTOM:
#			queue_free()
#	elif area is Brick:
#		print(get_class())
#		area.queue_free()
