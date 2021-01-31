extends Node

onready var mainMenu = preload("res://scenes/MainMenu.tscn").instance()
onready var mainScene = preload("res://scenes/MainScene.tscn").instance()
onready var islandScenes = [
	preload("res://scenes/Island.tscn"),
	preload("res://scenes/Island1.tscn"),
	preload("res://scenes/Island2.tscn"),
	preload("res://scenes/Island3.tscn"),
	preload("res://scenes/Island4.tscn"),
	preload("res://scenes/Island5.tscn")
]
onready var islandsCollection = []

onready var rootScene = get_tree().get_current_scene()

var is_on_floor = false
var can_spawn_island = true
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
	if gameState == "stopped":
		rootScene.add_child(mainScene)
		spawn_island(Vector3(0, 0, 0))
	main_scene()
	gameState = "started"

func pause_game():
	get_tree().paused = false
	menu_scene()
	gameState = "paused"

func menu_scene():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true
	mainScene.hide()
	mainMenu.show()

func main_scene():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mainMenu.hide()
	get_tree().paused = false
	mainScene.show()

func spawn_island(coordinates):
	if not can_spawn_island:
		return

	can_spawn_island = false
	var timer = get_tree().create_timer(4.5)
	timer.connect("timeout", self, "_spawn_timeout")

	var island = _rnd_select_island()
	var meshInstance = island.get_node("RigidBody/CollisionShape/MeshInstance")
	var aabb = meshInstance.get_aabb()
	var height = aabb.size.z
	coordinates.y -= (height + 0.2)
	island.translate(coordinates)
	islandsCollection.push_back(island)
	mainScene.add_child(island)

func _rnd_select_island():
	var index = randi() % islandScenes.size()
	return islandScenes[index].instance()

func _spawn_timeout():
	can_spawn_island = true
