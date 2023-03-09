extends CanvasLayer

var score: int = 0
var lives: int = 3

func _ready():
	$HBoxContainer/ScoreValue.text = String(score)
	if lives == 2:
		$TextureRect3.hide()
	elif lives == 1:
		$TextureRect3.hide()
		$TextureRect2.hide()
	elif lives == 0:
		get_tree().change_scene("res://GameOver.tscn")

func _on_KinematicBody2D_gold_coin_collected():
	score = score + 1
	_ready()


func _on_KinematicBody2D_red_coin_collected():
	score = score + 5
	_ready()


func _on_KinematicBody2D_silver_coin_collected():
	score = score + 10
	_ready()


func _on_KinematicBody2D_lives_count():
	lives -= 1
	_ready()
