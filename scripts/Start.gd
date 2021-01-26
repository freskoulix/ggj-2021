extends Button

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	self.connect("pressed", self, "_start_pressed")

func _start_pressed():
	get_tree().change_scene("res://scenes/MainScene.tscn")
