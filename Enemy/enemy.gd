extends Node2D

@export var balle : Node2D
var speed := 100 
var vision_distance := 370 
var difficulty
var can_move := false
var two_players := false

func _physics_process(delta: float) -> void:
	if two_players:
		speed = 200
		var new_position = position.y

		if Input.is_action_pressed("down2"):
			new_position += speed * delta
		if Input.is_action_pressed("up2"):
			new_position -= speed * delta

		position.y = clamp(new_position, 60, 420)
	else:
		check_movement()
		if not can_move:
			return

		var new_position = position.y
		if balle.position.y > position.y:
			new_position += speed * delta
		else:
			new_position -= speed * delta

		position.y = clamp(new_position, 60, 420)

func check_movement() -> void:
	if balle.position.x > vision_distance:
		can_move = true
	else:
		can_move = false

func _easy() -> void:
	speed = 75
	vision_distance = 420

func _medium() -> void:
	speed = 100
	vision_distance = 370

func _hard() -> void:
	speed = 125
	vision_distance = 320

func _on_button_4_button_up() -> void:
	two_players = true
