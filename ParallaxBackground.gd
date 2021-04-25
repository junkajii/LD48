extends ParallaxBackground

func _process(delta):
	scroll_offset.y -= 1000 * delta
