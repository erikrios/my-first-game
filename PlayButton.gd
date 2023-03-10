extends Button

func _on_PlayButton_pressed():
	PlayerVars.lives = 3
	get_tree().change_scene("res://GameLevel.tscn")

