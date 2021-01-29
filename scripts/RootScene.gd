extends Node

onready var mainMenu = preload("res://scenes/MainMenu.tscn").instance()
onready var mainScene = preload("res://scenes/MainScene.tscn").instance()
onready var rootScene = get_tree().get_current_scene()

var gameState = "stopped"

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	root_init()

func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

	if Input.is_key_pressed(KEY_ESCAPE):
		if gameState == "stopped":
			return

		pause_game()

func root_init():
	rootScene.add_child(mainMenu)
	menu_scene()
	gameState = "stopped"

func start_game():
	rootScene.add_child(mainScene)
	main_scene()
	gameState = "started"

func pause_game():
	menu_scene()
	gameState = "paused"

func menu_scene():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mainScene.hide()
	mainMenu.show()

func main_scene():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mainMenu.hide()
	mainScene.show()
