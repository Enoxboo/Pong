extends Node2D

@export var speed := -500
var angle := 90
@export var score : RichTextLabel
@export var winner_text : RichTextLabel
var score1 := 0
var score2 := 0
var win := true

@export var victory_screen : Control
@export var main_screen : Control


func _ready() -> void:
	update_score(0, 0)
	victory_screen.visible = false
	main_screen.visible = true

func _process(delta: float) -> void:
	if win:
		return
	
	position.x += speed * delta
	position.y += angle * delta

	if position.y < 60 or position.y > 420:
		angle *= -1
	
	if position.x < 0:
		reset_position()
		update_score(0, 1)
		
	if position.x > 640:
		reset_position()
		update_score(1, 0)
		

func reset_position():
	position.x = 320
	position.y = 240
	speed = 300
	angle = 90

func update_score(point1, point2):
	score1 += point1
	score2 += point2
	score.text = str(score1) + " - " + str(score2)
	if score1 == 10:
		win_game("Player 1")
	elif score2 == 10:
		win_game("Player 2")

func win_game(winner):
	reset_position()
	win = true
	winner_text.text = winner + " won"
	victory_screen.visible = true
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	var new_angle = angle
	var new_speed = speed
	var raquette_y = area.global_position.y
	var ball_y = position.y
	
	angle = (ball_y - raquette_y)*10
	speed *= -1
	
	angle = clamp(new_angle, -300, 300)


func _on_button_button_down() -> void:
	victory_screen.visible = false
	main_screen.visible = false
	win = false
	score1 = 0
	score2 = 0
	update_score(0, 0)


func _on_button_2_button_down() -> void:
	victory_screen.visible = false
	main_screen.visible = true
