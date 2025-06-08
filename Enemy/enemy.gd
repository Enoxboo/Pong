extends Node2D

@export var balle : Node2D 
var speed := 200

func _process(delta: float) -> void:
	position.y = balle.position.y
