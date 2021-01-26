extends Node

const KEYBOARD_SENS = 0.2
const MOUSE_SENS = 0.002

onready var scene = get_tree().get_current_scene()
onready var character = scene.get_node('Character')

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	keyboard_handler()

func _input(event): 
	if event is InputEventMouseMotion:
		mouse_handler(event)
	
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func keyboard_handler():
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://scenes/MainMenu.tscn")
	
	if Input.is_key_pressed(KEY_W):
		var pos = Vector3(0, 0, -KEYBOARD_SENS)
		character.translate(pos)
	elif Input.is_key_pressed(KEY_S):
		var pos = Vector3(0, 0, KEYBOARD_SENS)
		character.translate(pos)

	if Input.is_key_pressed(KEY_A):
		var pos = Vector3(-KEYBOARD_SENS, 0, 0)
		character.translate(pos)
	elif Input.is_key_pressed(KEY_D):
		var pos = Vector3(+KEYBOARD_SENS, 0, 0)
		character.translate(pos)

func mouse_handler(event):
	var move = event.relative * MOUSE_SENS

	character.rotate_y(-move.x)
	character.orthonormalize()
