extends CPUParticles2D

func _ready():
	emitting = true

# warning-ignore:unused_argument
func _process(delta):
	if !emitting:
		queue_free()

