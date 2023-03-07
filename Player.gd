extends KinematicBody2D

var velocity = Vector2(0, 0)
var gravity = 2000
var score = 0

func _physics_process(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -1000
		$AnimatedSprite.play("jump")
		
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
		
	velocity.y = velocity.y + gravity * (delta)
		
	move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.1)

func score_count_gold():
	score = score + 1
	
func score_count_red():
	score = score + 5

func score_count_silver():
	score = score + 10

func _on_Fall_Area_body_entered(body):
	get_tree().change_scene("res://GameLevel.tscn")


func _on_FinishLevelArea_body_entered(body):
	get_tree().change_scene("res://GameLevel.tscn")
