extends Area2D


func _ready():
	$AnimationPlayer.play("silver_coin_anim")


func _on_SilverCoin_body_entered(body):
	body.score_count_silver()
	queue_free()
