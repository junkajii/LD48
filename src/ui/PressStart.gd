extends Label

func _process(_delta):
	visible = false
	yield(get_tree().create_timer(0.5), "timeout")
	visible = true
	yield(get_tree().create_timer(0.5), "timeout")
