extends Node2D

onready var asta = preload('res://Scenes/Asteroids.tscn')

func _on_Rocket_bullet_created(new_bullet):
	add_child(new_bullet)

func _on_Timer_timeout():
	$AsteroidSpawn/AsteroidSpawnLocation.offset = randi()
	var astero = asta.instance()
	add_child(astero)
	var direction = $AsteroidSpawn/AsteroidSpawnLocation.rotation + TAU / 4
	astero.position = $AsteroidSpawn/AsteroidSpawnLocation.position
	direction += rand_range(-TAU / 8, TAU / 8)
	astero.rotation = direction
	#astero.linear_velocity = Vector2(200, 0).rotated(direction)
	#astero.look_at($Planet.position)
