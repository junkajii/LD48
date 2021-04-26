extends Node2D

const pill = preload("res://src/collectables/Pill.tscn")
const soda = preload("res://src/collectables/Soda.tscn")
const gameboy = preload("res://src/collectables/Gameboy.tscn")
const hotdog = preload("res://src/collectables/HotDog.tscn")
const coin = preload("res://src/collectables/Coin.tscn")
const bomb = preload("res://src/Enemys/Bomb.tscn")
const jaw = preload("res://src/Enemys/Jaw.tscn")
const knife = preload("res://src/Enemys/Knife.tscn")
const spike = preload("res://src/Enemys/Spike.tscn")

onready var collectables = [pill, soda, gameboy, hotdog, coin, bomb, jaw, knife, spike]
onready var spawn_points = $SpawnePoints
var rng = RandomNumberGenerator.new()
var last_num

func get_collectable() -> PackedScene:
#	collectables.shuffle()
	var num = rng.randi_range(0, 8)
	while(num == last_num):
		num = rng.randi_range(0, 8)
	last_num = num
	return collectables[num]

func get_spawn_position() -> Vector2:
	var points = spawn_points.get_children()
	points.shuffle()
	return points[rng.randi_range(0, 6)].global_position

func spawn() -> void:
	var spawn_position = get_spawn_position()
	var collectable = get_collectable().instance()
	var main = get_tree().current_scene
	main.add_child(collectable)
	collectable.position = spawn_position
	collectable.get_node("Sprite").flip_h = false if randi() % 2 == 0 else true

func _on_Timer_timeout():
	spawn()
