extends RigidBody2D

export var speed = 2000

func _ready():
	linear_velocity = Vector2(speed,0).rotated(rotation)


# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Laser_body_shape_entered(body_id, body, body_shape, local_shape):
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
