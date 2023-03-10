extends Area2D

func _physics_process(_delta):
	position.x = position.x + 1000 * (_delta)


func _on_Fireball_area_entered(area):
	queue_free()
