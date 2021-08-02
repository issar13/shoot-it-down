extends KinematicBody2D
const SPEED = 150

var asteroid_types = ['brown','dark','grey','greey']
var velocity = Vector2(1,0)
onready var planet = get_parent().get_node("Planet")
onready var explode = preload('res://Scenes/ParticlesEffect.tscn')
onready var brown = preload('res://Scenes/brown.tscn')


func _physics_process(delta):
	look_at(planet.position)
	move_and_slide(velocity.rotated(rotation) * SPEED) 

func _ready():
	$Asteroids.animation = asteroid_types[randi() % asteroid_types.size()]

func _on_Collide_body_entered(body):
		var effect = explode.instance()
		effect.position = position
		get_parent().add_child(effect)
		queue_free()
