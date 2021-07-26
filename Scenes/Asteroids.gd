extends KinematicBody2D

const SPEED = 150

var asteroid_types = ['brown','dark','grey','greey']
var velocity = Vector2(1,0)
var direction = 1
onready var planet = get_parent().get_node("Planet")


func _physics_process(delta):
	look_at(planet.position)
	move_and_slide(velocity.rotated(rotation) * SPEED) 

func _ready():
	$Asteroids.animation = asteroid_types[randi() % asteroid_types.size()]

func _on_Collide_body_entered(body):
	queue_free()
