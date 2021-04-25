extends CanvasLayer

onready var score_label = $MarginContainer/CenterContainer/VBoxContainer/Score
onready var anim = $AnimationPlayer
#onready var health_bar = $HealthBar
var score = 0
var damage_count = 0

func _on_ScoreTimer_timeout():
	score += 1
	score_label.text = str("%010d" % score)

func up_score() -> void:
	score += 1000
	anim.play("bounce_score")
#	score_label.text = str("%010d" % score)
	# + bounce

func damage() -> void:
	var hearts = $HealthBar.get_children()
	if damage_count == 0:
		hearts[0].visible = false
		damage_count += 1
	elif damage_count == 1:
		hearts[1].visible = false
		damage_count += 1
	else:
		hearts[2].visible = false
		print("GAME OVER")
