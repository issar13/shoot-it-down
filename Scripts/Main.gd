extends Node2D

onready var asta = preload('res://Scenes/Asteroids.tscn')
const SCALE = [0.2,0.3,0.4]


func _on_Timer_timeout():
	$AsteroidSpawn/AsteroidSpawnLocation.offset = randi()
	var astero = asta.instance()
	add_child(astero)
	var direction = $AsteroidSpawn/AsteroidSpawnLocation.rotation + TAU / 4
	astero.position = $AsteroidSpawn/AsteroidSpawnLocation.position
	direction += rand_range(-TAU / 8, TAU / 8)
	astero.rotation = direction
