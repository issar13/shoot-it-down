extends Node2D

signal increase

onready var asta = preload('res://Scenes/Asteroids.tscn')
onready var asterix = preload('res://Scenes/BigAsteroids.tscn')

func _on_Timer_timeout():
	$AsteroidSpawn/AsteroidSpawnLocation.offset = randi()
	var astero = asta.instance()
	add_child(astero)
	var direction = $AsteroidSpawn/AsteroidSpawnLocation.rotation + TAU / 4
	astero.position = $AsteroidSpawn/AsteroidSpawnLocation.position
	direction += rand_range(-TAU / 8, TAU / 8)
	astero.rotation = direction


func _on_BigSpawn_timeout():
	$AsteroidSpawn/AsteroidSpawnLocation.offset = randi()
	var asteri = asterix.instance()
	add_child(asteri)
	var direction = $AsteroidSpawn/AsteroidSpawnLocation.rotation + TAU / 4
	asteri.position = $AsteroidSpawn/AsteroidSpawnLocation.position
	direction += rand_range(-TAU / 8, TAU / 8)
	asteri.rotation = direction
	emit_signal('increase')

func increase_time():
	$BigSpawn.wait_time -= 0.5
	$SmallSpawn.wait_time -= 0.5
