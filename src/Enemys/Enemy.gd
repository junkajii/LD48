class_name Enemy
extends Area2D

const SPEED = 1000
onready var audio_player = $AudioStreamPlayer2D

func _process(delta):
	position.y -= SPEED * delta

func play_sfx() -> void:
	audio_player.play()
	yield($AudioStreamPlayer2D,"finished")
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
