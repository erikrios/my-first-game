extends KinematicBody2D

var velocity = Vector2(0, 0)
var gravity = 2000

signal gold_coin_collected
signal red_coin_collected
signal silver_coin_collected

var lives: int = 3
signal lives_count

func _physics_process(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -1000
		$AnimatedSprite.play("jump")
		$AudioStreamPlayer.play()
		
	if Input.is_action_pressed("left_arrow"):
		velocity.x = -300
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("right_arrow"):
		velocity.x = 300
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.play("idle")
		
	if not is_on_floor():
		$AnimatedSprite.play("jump")
		$AudioStreamPlayer.play()
		
	velocity.y = velocity.y + gravity * (delta)
		
	move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.1)

func score_count_gold():
	emit_signal("gold_coin_collected")
	
func score_count_red():
	emit_signal("red_coin_collected")

func score_count_silver():
	emit_signal("silver_coin_collected")
	
func hit_enemy():
	lives -= 1
	emit_signal("lives_count")
	set_modulate(Color(1, 0.3, 0.3, 0.6))
	$Timer.start()

func _on_Fall_Area_body_entered(body):
	get_tree().change_scene("res://GameOver.tscn")


func _on_FinishLevelArea_body_entered(body):
	get_tree().change_scene("res://WinScreen.tscn")


func _on_Timer_timeout():
	set_modulate(Color(1, 1, 1, 1))
