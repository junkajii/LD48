extends ParallaxBackground

const SPEED = 2000

func _process(delta):
	scroll_offset.y -= SPEED * delta
