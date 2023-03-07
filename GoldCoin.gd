extends Area2D


func _ready():
	$AnimationPlayer.play("Rotate_Coin")


func _on_GoldCoin_body_entered(body):
	body.score_count_gold()
	queue_free()
