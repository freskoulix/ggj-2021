extends Button

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	self.connect("pressed", self, "_exit_pressed")

func _exit_pressed():
	get_tree().quit()
