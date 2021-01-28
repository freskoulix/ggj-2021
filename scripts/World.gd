extends Spatial

onready var scene = get_tree().get_current_scene()
onready var world = scene.mainScene.get_node('World')
onready var worldMesh = world.find_node('MeshInstance', true, false)

func _ready():
	pass
