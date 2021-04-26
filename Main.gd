extends Node2D

onready var statusbar = $StatusBar
onready var music = $AudioStreamPlayer

func _ready():
	if AudioManager.music_toggle == false:
		music.play()
	else:
		music.stop()
