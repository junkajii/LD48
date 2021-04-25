extends CanvasLayer

onready var score_label = $MarginContainer/CenterContainer/VBoxContainer/Score
var score = 0

func _on_ScoreTimer_timeout():
	score += 1
	score_label.text = str("%010d" % score)
