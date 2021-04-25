extends KinematicBody2D

const ACELERATION = 3000
const MAX_SPEED = 1000
const FRICTION = 1000

var velocity: Vector2 = Vector2.ZERO
var input: Vector2 = Vector2.ZERO

onready var main = get_parent()
onready var anim = $AnimationPlayer
var rng = RandomNumberGenerator.new()
var last_num

func _ready():
	var num = rng.randi_range(0, 5)
	$Sprite.texture = load("res://assets/sprites/player-%d.png" % num)

func _process(_delta):
	position.x = clamp(position.x, 570, 1400)
	position.y = clamp(position.y, 50, 1030)
	if Input.is_action_just_pressed("ui_end"):
		main.statusbar.damage()

func _physics_process(delta):
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input = input.normalized()

	if input != Vector2.ZERO:
		velocity = velocity.move_toward(input * MAX_SPEED, ACELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	velocity = move_and_slide(velocity)


func _on_Area2D_area_entered(area):
	if area is Enemy:
		area.visible = false
		main.statusbar.damage()
	if area is Collectable:
		area.play_sfx()
		area.visible = false
		main.statusbar.up_score()
	var num = rng.randi_range(0, 5)
	while(num == last_num):
		num = rng.randi_range(0, 5)
	last_num = num
	$Sprite.texture = load("res://assets/sprites/player-%d.png" % num)
	anim.play("bounce")

