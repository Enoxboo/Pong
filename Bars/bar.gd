extends Node2D

@export var speed := 200

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var new_position = position.y

	if Input.is_action_pressed("down"):
		new_position += speed * delta
	if Input.is_action_pressed("up"):
		new_position -= speed * delta

	position.y = clamp(new_position, 60, 420)
