extends Area2D


func _ready():
	$AnimationPlayer.play("Rotate_Coin")


func _on_GoldCoin_body_entered(body):
	$CoinCollectedSound.play()
	$AnimationPlayer2.play("coin_bounce")
	body.score_count_gold()

func _on_AnimationPlayer2_animation_finished(anim_name):
	queue_free()
