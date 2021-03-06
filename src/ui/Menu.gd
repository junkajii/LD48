extends CanvasLayer

onready var btn_music = $Control/ButtonMusic
onready var btn_sfx = $Control/ButtonSFX
onready var btn_pressstart = $Control/PressStart

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Main.tscn")

func _on_ButtonSFX_toggled(button_pressed):
	var audio_player = $Control/ButtonSFX/AudioStreamPlayer
	audio_player.play()
	AudioManager.sfx_toggle = !AudioManager.sfx_toggle

func _on_ButtonMusic_toggled(button_pressed):
	var audio_player = $Control/ButtonMusic/AudioStreamPlayer
	audio_player.play()
	AudioManager.music_toggle = !AudioManager.music_toggle


func _on_PressStart_mouse_entered():
	btn_pressstart.rect_scale = Vector2(1.3, 1.3)


func _on_PressStart_mouse_exited():
	btn_pressstart.rect_scale = Vector2(1, 1)


func _on_ButtonSFX_mouse_entered():
	btn_sfx.rect_scale = Vector2(1.3, 1.3)


func _on_ButtonSFX_mouse_exited():
	btn_sfx.rect_scale = Vector2(1, 1)


func _on_ButtonMusic_mouse_entered():
	btn_music.rect_scale = Vector2(1.3, 1.3)


func _on_ButtonMusic_mouse_exited():
	btn_music.rect_scale = Vector2(1, 1)


func _on_PressStart_gui_input(event):
	if event is InputEventMouseButton:
		get_tree().change_scene("res://Main.tscn")
