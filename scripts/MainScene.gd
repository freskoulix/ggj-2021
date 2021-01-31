extends Spatial

onready var characterScene = preload("res://scenes/Character.tscn").instance()
onready var rootScene = get_tree().get_current_scene()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	self.add_child(characterScene)
