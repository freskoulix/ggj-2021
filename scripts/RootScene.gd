extends Node

onready var mainMenu = preload("res://scenes/MainMenu.tscn").instance()
onready var mainScene = preload("res://scenes/MainScene.tscn").instance()
onready var islandScenes = [
	#preload("res://scenes/Island.tscn"),
	#preload("res://scenes/Island1.tscn"),
	#preload("res://scenes/Island2.tscn"),
	preload("res://scenes/Island3.tscn")
]
onready var islandsCollection = []

onready var rootScene = get_tree().get_current_scene()

var canSpawnIsland = true
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
	spawn_island(Vector3(0, 0, 0))
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

func spawn_island(coordinates):
	if not canSpawnIsland:
		return

	var timer = get_tree().create_timer(1.0)
	timer.connect("timeout", self, "_spawn_timeout")
	canSpawnIsland = false

	var island = _rnd_select_island()
	coordinates.y -= 5
	island.translate(coordinates)
	islandsCollection.push_back(island)
	rootScene.add_child(island)

func _rnd_select_island():
	var index = randi() % islandScenes.size()
	return islandScenes[index].instance()

func _spawn_timeout():
	canSpawnIsland = true
