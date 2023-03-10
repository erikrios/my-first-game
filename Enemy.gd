extends KinematicBody2D

var velocity: Vector2 = Vector2(0, 0)
var speed: int = 100
var direction: int = -1
var lives: int = 3

func _physics_process(delta):
	velocity.x = speed * direction
	
	if direction == -1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	$AnimatedSprite.play("run")
	move_and_slide(velocity)
	
	if !$RayCast2D.is_colliding():
		direction *= -1
		$RayCast2D.position.x *= -1


func _on_CollisionChecker_body_entered(body):
	body.hit_enemy()


func _on_FireballCollisionChecker_area_entered(area):
	queue_free()
