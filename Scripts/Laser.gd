extends RigidBody2D

export var speed = 1500

func _ready():
	linear_velocity = Vector2(speed,0).rotated(rotation)

func _on_Laser_body_shape_entered(body_id, body, body_shape, local_shape):
	queue_free()


func increase_rate():
	speed = 2500
