extends Control

onready var score = $Score

func _ready():
	var save_data = SaveAndLoad.load_data()
	score.text = str("%010d" % save_data.highscore)

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://src/ui/Menu.tscn")
