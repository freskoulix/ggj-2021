extends Button

func _ready():
	self.connect("pressed", self, "_start_pressed")

func _start_pressed():
	get_tree().get_current_scene().start_game()
