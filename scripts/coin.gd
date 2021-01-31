extends Area

signal boneCollected

func _ready():
	pass

func _physics_process(delta):
	rotate_y(deg2rad(3))

func _on_coin_body_entered(body):
	if body.name == "Player":
		$Timer.start()

func _on_Timer_timeout():
	emit_signal("boneCollected")
	queue_free()


func _on_coin_boneCollected():
	pass # Replace with function body.
