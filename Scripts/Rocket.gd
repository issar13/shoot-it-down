extends KinematicBody2D

signal bullet_created(new_bullet)

var screen_size
var speed = 700

export var move_speed : = 350.0
export var turn_speed : = 175.0
onready var bullet = preload('res://Scenes/Laser.tscn')


func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	var mpos = get_global_mouse_position()
	var motion : = Vector2()
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	motion.y = Input.get_action_strength("back") - Input.get_action_strength("front")
	$".".global_rotation = mpos.angle_to_point(position)
	$shoot.global_rotation = mpos.angle_to_point(position)
	if motion.length() > 0:
		motion = motion.normalized() * speed
	position += motion * delta

func _input(event):
	if event.is_action_pressed("shoot"):
		var new_bullet = bullet.instance()
		new_bullet.global_position = $shoot.global_position
		new_bullet.global_rotation = $shoot.global_rotation
		emit_signal("bullet_created", new_bullet)
