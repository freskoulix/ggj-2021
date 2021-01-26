extends Node

onready var mainMenu = preload("res://scenes/MainMenu.tscn").instance()
onready var mainScene = preload("res://scenes/MainScene.tscn").instance()
onready var rootScene = get_tree().get_current_scene()

var isGameRunning = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	rootScene.add_child(mainMenu)
	mainScene.hide()
	rootScene.add_child(mainScene)

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		mainScene.hide()
		mainMenu.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		isGameRunning = false

func start_game():
	mainMenu.hide()
	mainScene.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	isGameRunning = true
