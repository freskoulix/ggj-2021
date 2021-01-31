extends Area

func _ready():
	pass

func _physics_process(delta):
	rotate_y(deg2rad(3))

func _on_coin_body_entered(body):
	if body.name == "Player":
		$Timer.start()

func _on_Timer_timeout():
	queue_free()
