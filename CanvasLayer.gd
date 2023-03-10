extends CanvasLayer

func _ready():
	$HBoxContainer/ScoreValue.text = String(PlayerVars.score)
	if PlayerVars.lives == 2:
		$TextureRect3.hide()
	elif PlayerVars.lives == 1:
		$TextureRect3.hide()
		$TextureRect2.hide()
	elif PlayerVars.lives == 0:
		get_tree().change_scene("res://GameOver.tscn")
func _on_KinematicBody2D_gold_coin_collected():
	PlayerVars.score = PlayerVars.score + 1
	_ready()


func _on_KinematicBody2D_red_coin_collected():
	PlayerVars.score = PlayerVars.score + 5
	_ready()


func _on_KinematicBody2D_silver_coin_collected():
	PlayerVars.score = PlayerVars.score + 10
	_ready()

func _on_KinematicBody2D_lives_count():
	PlayerVars.lives -= 1
	_ready()
