extends Area

onready var rootScene = get_tree().get_current_scene()
onready var hud = rootScene.find_node("HUD", true, false)
onready var counter = hud.get_node("Counter")

func _physics_process(delta):
	rotate_y(deg2rad(3))

func _on_coin_body_entered(body):
	if body.name == "Player":
		rootScene.coinsCollected += 1
		counter.text = str(rootScene.coinsCollected)
		queue_free()
