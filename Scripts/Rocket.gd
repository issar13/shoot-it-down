extends KinematicBody2D

var screen_size
var speed = 1000

onready var bullet = preload('res://Scenes/Laser.tscn')
onready var shoot_positions = $ShootingPositions
onready var fireDelayTimer := $FireDelayTimer

export var firedelay = 0.1

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
	if motion.length() > 0:
		motion = motion.normalized() * speed
	position += motion * delta

func _input(event):
	if event.is_action_pressed("shoot") and fireDelayTimer.is_stopped():
		fireDelayTimer.start(firedelay)
		for child in shoot_positions.get_children():
			var new_bullet = bullet.instance()
			new_bullet.global_position = child.global_position
			new_bullet.global_rotation = $".".global_rotation
			get_tree().current_scene.add_child(new_bullet)
