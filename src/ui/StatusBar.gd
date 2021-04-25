extends CanvasLayer

onready var score_label = $MarginContainer/CenterContainer/VBoxContainer/Score
onready var anim = $AnimationPlayer
var score = 0

func _on_ScoreTimer_timeout():
	score += 1
	score_label.text = str("%010d" % score)

func up_score() -> void:
	score += 1000
	anim.play("bounce_score")
#	score_label.text = str("%010d" % score)
	# + bounce
