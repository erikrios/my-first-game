extends Area2D


func _ready():
	$AnimationPlayer.play("red_coin_anim")

func _on_RedCoin_body_entered(body):
	body.score_count_red()
	queue_free()
