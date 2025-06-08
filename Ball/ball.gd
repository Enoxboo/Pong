extends Node2D

@export var speed := -300
var angle := 90

func _process(delta: float) -> void:
	position.x += speed * delta
	position.y += angle * delta

	if position.y < 60 or position.y > 420:
		angle *= -1

func _on_area_2d_area_entered(area: Area2D) -> void:
	var raquette_y = area.global_position.y
	var ball_y = position.y
	
	angle = ball_y - raquette_y

	speed *= -1.05
