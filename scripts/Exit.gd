extends Button

func _ready():
	self.connect("pressed", self, "_exit_pressed")

func _exit_pressed():
	get_tree().quit()
