extends Spatial

onready var root = $"Character"
onready var rb = $"RigidBody"

func _ready():
	pass

func _process(delta):
	pass

func _physic_process(delta):
	pass

func _input(event):
	keybobar_handler(event)
	
func keyboard_handler(event):
	if event is InputEventKey:
		match event.scancode:
			KEY_W:
			KEY_A:
			KEY_S:
			KEY_D:

	match Input.
	if Input.is_key_pressed(KEY_W):
		var pos = Vector3(0, 0, -KEYBOARD_SENS)
		characterRb.set_linear_velocity(pos)
	elif Input.is_key_pressed(KEY_S):
		var pos = Vector3(0, 0, KEYBOARD_SENS)
		characterRb.set_linear_velocity(pos)

	if Input.is_key_pressed(KEY_A):
		var pos = Vector3(-KEYBOARD_SENS, 0, 0)
		characterRb.set_linear_velocity(pos)
	elif Input.is_key_pressed(KEY_D):
		var pos = Vector3(+KEYBOARD_SENS, 0, 0)
		characterRb.set_linear_velocity(pos)
