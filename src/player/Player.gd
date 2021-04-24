extends KinematicBody2D

const ACELERATION = 500
const MAX_SPEED = 500
const FRICTION = 100

var velocity: Vector2 = Vector2.ZERO
var input: Vector2 = Vector2.ZERO

func _physics_process(delta):
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input = input.normalized()

	if input != Vector2.ZERO:
		velocity = velocity.move_toward(input * MAX_SPEED, ACELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	velocity = move_and_slide(velocity)
