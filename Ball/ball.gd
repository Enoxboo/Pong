extends Node2D

@export var speed := -300
var angle := 90
@export var score : RichTextLabel
var score1 := 0
var score2 := 0
var win := false

func _ready() -> void:
	update_score(0, 0)

func _process(delta: float) -> void:
	if win:
		return
	
	position.x += speed * delta
	position.y += angle * delta

	if position.y < 60 or position.y > 420:
		angle *= -1
	
	if position.x < 0:
		reset_position()
		update_score(1, 0)
		
	if position.x > 640:
		reset_position()
		update_score(0, 1)
	

func reset_position():
	position.x = 320
	position.y = 240

func update_score(point1, point2):
	score1 += point1
	score2 += point2
	score.text = str(score1) + " - " + str(score2)
	if score1 == 10 or score2 == 10:
		win_game()

func win_game():
	reset_position()
	win = true
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	var raquette_y = area.global_position.y
	var ball_y = position.y
	
	angle = ball_y - raquette_y

	speed *= -1.05
